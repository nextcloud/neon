#!/usr/bin/env php
<?php

declare(strict_types=1);

include('external/nextcloud-server/lib/public/RichObjectStrings/Definitions.php');
$definitions = (new OCP\RichObjectStrings\Definitions())->definitions;

$properties = [
    'type' => [
        'type' => 'string',
        'enum' => array_keys($definitions),
    ],
    'id' => ['type' => 'string'],
    'name' => ['type' => 'string'],
];

foreach ($definitions as $type => $object) {
    foreach ($object['parameters'] as $name => $parameter) {
        $properties[$name] ??= [
            'type' => 'string',
            'description' => $parameter['description'],
            'example' => $parameter['example'],
        ];
    }
}

$properties['type']['enum'][] = 'group';
$properties['etag'] = ['type' => 'string'];
$properties['width'] = ['type' => 'string'];
$properties['height'] = ['type' => 'string'];

$patch = [
    [
        'op' => 'replace',
        'path' => '/components/schemas/BaseMessage/properties/messageParameters/additionalProperties',
        'value' => [
            '$ref' => '#/components/schemas/RichObjectParameter',
        ],
    ],
    [
        'op' => 'add',
        'path' => '/components/schemas/RichObjectParameter',
        'value' => [
            'type' => 'object',
            'required' => ['type', 'id', 'name'],
            'properties' => $properties,
        ],
    ],
];

$data = json_encode($patch, JSON_THROW_ON_ERROR | JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT);
if ($data === false) {
    throw new RuntimeException('Failed to encode JSON');
}
$success = file_put_contents('packages/nextcloud/lib/src/api/spreed/patches/1-message-parameters.json', $data);
if ($success === false) {
    throw new RuntimeException('Failed to write JSON');
}
