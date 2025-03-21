{include file='base.tpl'}

<h2 class="tw-text-lg tw-font-bold tw-mb-4">Select an account</h2>

<div class="tw-flex tw-gap-8 tw-justify-center">
        {foreach $balanceList as $balance}
            <div class="tw-w-1/12 tw-rounded tw-overflow-hidden tw-shadow-lg">
                <div class="tw-px-6 tw-py-4">
                    <div class="tw-font-bold tw-text-xl tw-mb-2">{$balance.currency}</div>

                </div>
                <div class="tw-px-6 tw-pt-4 tw-pb-2 tw-flex tw-justify-center tw-mb-4">
                    <a href="{$moduleLink}&action=connect&provider=wise&step=4&profile={$profileId}&balance={$balance.id}" class="tw-bg-transparent hover:tw-bg-blue-500 tw-text-blue-700 tw-font-semibold hover:tw-text-white tw-py-4 tw-px-6 tw-border tw-border-blue-500 hover:tw-border-transparent tw-rounded tw-no-underline hover:tw-no-underline">Connect</a>
                </div>
            </div>
        {/foreach}
</div>

<p>
    <br>
    <a href="{$moduleLink}" class="tw-absolute tw-bottom-0 tw-bg-transparent hover:tw-bg-sky-500 tw-text-sky-700 hover:tw-text-white tw-py-4 tw-px-6 tw-border tw-border-sky-500 hover:tw-border-transparent tw-rounded tw-no-underline hover:tw-no-underline">
        <i class="fa fa-arrow-left"></i>
        Back to home
    </a>
</p>