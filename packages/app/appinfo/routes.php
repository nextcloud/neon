<?php

declare(strict_types=1);

return [
    'routes' => [
        ['name' => 'page#index', 'url' => '/', 'verb', 'GET'],
        ['name' => 'page#static', 'url' => '/static/{path}', 'verb' => 'GET', 'requirements' => ['path' => '.*']],
    ],
];
