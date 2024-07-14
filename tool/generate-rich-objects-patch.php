#!/usr/bin/env php
<?php

declare(strict_types=1);

$minVersion = '28.0.0';

include('external/nextcloud-server/lib/public/RichObjectStrings/Definitions.php');
$definitions = (new OCP\RichObjectStrings\Definitions())->definitions;

$schemas = [];
$discriminatorSchema = [
    'oneOf' => [],
    'discriminator' => [
        'propertyName' => 'type',
        'mapping' => [],
    ],
];

foreach ($definitions as $type => $object) {
    $schema = [
        'type' => 'object',
    ];

    $required = ['type'];
    $properties = [
        'type' => [
            'type' => 'string',
        ],
    ];

    foreach ($object['parameters'] as $name => $parameter) {
        if ($parameter['required'] === true && version_compare($parameter['since'], $minVersion, '<=')) {
            $required[] = $name;
        }

        $properties[$name] = [
            'type' => 'string',
            'description' => $parameter['description'],
            'example' => $parameter['example'],
        ];
    }

    $schema['required'] = $required;
    $schema['properties'] = $properties;

    $schemaName = 'RichObjectParameter' . ucfirst(str_replace('-', '', ucwords($type, '-')));
    $schemas[$schemaName] = $schema;

    $discriminatorSchema['oneOf'][] = [
        '$ref' => '#/components/schemas/' . $schemaName,
    ];
    $discriminatorSchema['discriminator']['mapping'][$type] = '#/components/schemas/' . $schemaName;
}

$schemas['RichObjectParameter'] = $discriminatorSchema;

$patch = [];
foreach ($schemas as $name => $schema) {
    $patch[] = [
        'op' => 'add',
        'path' => '/components/schemas/' . $name,
        'value' => $schema,
    ];
}

$data = json_encode($patch, JSON_THROW_ON_ERROR | JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT);
if ($data === false) {
    throw new RuntimeException('Failed to encode JSON');
}
$success = file_put_contents('packages/nextcloud/lib/src/api/core/patches/0-rich-object-parameter.json', $data);
if ($success === false) {
    throw new RuntimeException('Failed to write JSON');
}
