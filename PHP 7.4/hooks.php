<?php

use Phpfastcache\CacheManager;
use Phpfastcache\Drivers\Files\Config;
use WHMCS\Module\Addon\OpenbankingReconciliation\Admin\AdminAreaWidget;
use WHMCS\Module\Addon\OpenbankingReconciliation\CronHandler;

add_hook('AfterCronJob', 1, function (array $params) {
    require_once __DIR__ . '/vendor/autoload.php';
    try {
        CacheManager::setDefaultConfig(new Config([
            'path' => __DIR__ . '/cache',
            'securityKey' => 'openbanking_reconciliation',
        ]));

        $cronHandler = new CronHandler();
        $cronHandler->handleCron();
    } catch (Exception $e) {
        logModuleCall('openbanking_reconciliation', 'Cron failed', '', $e->getMessage(), '', []);
    }
});

add_hook('AdminHomeWidgets', 1, function () {
    return new AdminAreaWidget();
});
