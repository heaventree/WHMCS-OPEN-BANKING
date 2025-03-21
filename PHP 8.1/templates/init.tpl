{include file='base.tpl'}

<h2 class="tw-text-lg tw-font-bold tw-mb-4">Choose a provider</h2>

<div class="tw-flex tw-gap-8 tw-justify-center tw-mb-24">
    <div class="tw-max-w-sm tw-rounded tw-overflow-hidden tw-shadow-lg">
        <img class="tw-w-full" src="{$baseUrl}modules/addons/openbanking_reconciliation/assets/gocardless@4x.png" alt="GoCardless">
        <div class="tw-px-6 tw-py-4">
            <div class="tw-font-bold tw-text-xl tw-mb-2">GoCardless</div>
            <p class="tw-text-gray-700 tw-text-base tw-h-48">
                Connect personal, business and corporate bank accounts of 2,500+ banks across the UK and Europe.
            </p>
        </div>
        <div class="tw-px-6 tw-pt-4 tw-pb-2 tw-flex tw-justify-center tw-mb-4">
            <a href="{$moduleLink}&action=connect&provider=gocardless&step=1" class="tw-bg-transparent hover:tw-bg-blue-500 tw-text-blue-700 tw-font-semibold hover:tw-text-white tw-py-4 tw-px-6 tw-border tw-border-blue-500 hover:tw-border-transparent tw-rounded tw-no-underline hover:tw-no-underline">Connect</a>
        </div>
    </div>
    <div class="tw-max-w-sm tw-rounded tw-overflow-hidden tw-shadow-lg">
        <img class="tw-w-full" src="{$baseUrl}modules/addons/openbanking_reconciliation/assets/wise@4x.png" alt="GoCardless">
        <div class="tw-px-6 tw-py-4">
            <div class="tw-font-bold tw-text-xl tw-mb-2">Wise</div>
            <p class="tw-text-gray-700 tw-text-base tw-h-48">
                Connect your Wise account directly through the platform API.
            </p>
        </div>
        <div class="tw-px-6 tw-pt-4 tw-pb-2 tw-flex tw-justify-center tw-mb-4">
            <a href="{$moduleLink}&action=connect&provider=wise&step=1" class="tw-bg-transparent hover:tw-bg-blue-500 tw-text-blue-700 tw-font-semibold hover:tw-text-white tw-py-4 tw-px-6 tw-border tw-border-blue-500 hover:tw-border-transparent tw-rounded tw-no-underline hover:tw-no-underline">Connect</a>
        </div>
    </div>
    <div class="tw-max-w-sm tw-rounded tw-overflow-hidden tw-shadow-lg">
        <img class="tw-w-full" src="{$baseUrl}modules/addons/openbanking_reconciliation/assets/plaid@4x.png" alt="GoCardless">
        <div class="tw-px-6 tw-py-4">
            <div class="tw-font-bold tw-text-xl tw-mb-2">Plaid</div>
            <p class="tw-text-gray-700 tw-text-base tw-h-48">
                Plaid has the most reliable open banking connectivity in Europe and North America. Limited countries available.
            </p>
        </div>
        <div class="tw-px-6 tw-pt-4 tw-pb-2 tw-flex tw-justify-center tw-mb-4">
            {*            <a href="{$moduleLink}&action=connect&provider=plaid&step=1" class="tw-bg-transparent hover:tw-bg-blue-500 tw-text-blue-700 tw-font-semibold hover:tw-text-white tw-py-4 tw-px-6 tw-border tw-border-blue-500 hover:tw-border-transparent tw-rounded tw-no-underline hover:tw-no-underline">Connect</a>*}
            <a href="#" class="tw-bg-transparent tw-text-gray-700 tw-font-semibold tw-py-4 tw-px-6 tw-border tw-border-gray-500 tw-rounded tw-no-underline hover:tw-no-underline tw-cursor-not-allowed">Coming Soon</a>
        </div>
    </div>
    <div class="tw-max-w-sm tw-rounded tw-overflow-hidden tw-shadow-lg">
        <img class="tw-w-full" src="{$baseUrl}modules/addons/openbanking_reconciliation/assets/enable@4x.png" alt="Enable Banking">
        <div class="tw-px-6 tw-py-4">
            <div class="tw-font-bold tw-text-xl tw-mb-2">Enable Banking</div>
            <p class="tw-text-gray-700 tw-text-base tw-h-48">
                Enable Banking, the leading open banking connectivity provider, offering a secure integration with 2500+ major banks across Europe.
            </p>
        </div>
        <div class="tw-px-6 tw-pt-4 tw-pb-2 tw-flex tw-justify-center tw-mb-4">
            {*            <a href="{$moduleLink}&action=connect&provider=enablebanking&step=1" class="tw-bg-transparent hover:tw-bg-blue-500 tw-text-blue-700 tw-font-semibold hover:tw-text-white tw-py-4 tw-px-6 tw-border tw-border-blue-500 hover:tw-border-transparent tw-rounded tw-no-underline hover:tw-no-underline">Connect</a>*}
            <a href="#" class="tw-bg-transparent tw-text-gray-700 tw-font-semibold tw-py-4 tw-px-6 tw-border tw-border-gray-500 tw-rounded tw-no-underline hover:tw-no-underline tw-cursor-not-allowed">Coming Soon</a>
        </div>
    </div>
</div>

{include file='subfooter.tpl'}
