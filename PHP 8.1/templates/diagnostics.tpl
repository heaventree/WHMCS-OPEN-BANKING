{include file='base.tpl'}

<h2 class="tw-text-xl tw-font-bold tw-mb-4">Diagnostics</h2>

{if $cron}
    <div class="successbox"><strong><span class="title">Success</span></strong><br>Cron handler successfully executed.</div>
{/if}

{foreach $informations as $information}
    <h3 class="tw-text-lg tw-font-bold tw-mb-4">{$information['title']}</h3>
    <ul>
        {foreach $information['items'] as $item}
            <li>{$item['title']} - {$item['value']}</li>
        {/foreach}
    </ul>
{/foreach}

<h3 class="tw-text-lg tw-font-bold tw-mb-4">Actions</h3>
<ul>
    <li><a href="{$moduleLink}&action=diagnosticsDownloadLog">Download logs</a></li>
    <li><a href="{$moduleLink}&action=diagnosticsRunCron">Run cron handler action manually</a></li>
    <li><a href="{$moduleLink}&action=clearcache">Clear Cache</a></li>
</ul>

{include file='subfooter.tpl'}
