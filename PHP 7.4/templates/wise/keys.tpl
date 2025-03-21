{include file='base.tpl'}

<h2 class="tw-text-lg tw-font-bold tw-mb-4">Add public key to Wise</h2>
<p class="tw-text-gray-700 tw-text-base">
    In order to access the transaction list on the Wise API, you'll need to add the following public key under Settings > API Tokens > Manage public keys. The private key is stored in the modules "keys" directory, you can remove the key any time and start a new integration to generate a new key.
</p>

<div class="tw-flex tw-gap-4 tw-my-4">
    <a href="#" onclick="downloadPublicKey()" class="tw-bg-transparent hover:tw-bg-blue-500 tw-text-blue-700 tw-font-semibold hover:tw-text-white tw-py-4 tw-px-6 tw-border tw-border-blue-500 hover:tw-border-transparent tw-rounded tw-no-underline hover:tw-no-underline">Download public key</a>
    <a href="{$moduleLink}&action=connect&provider=wise&step=2" class="tw-bg-transparent hover:tw-bg-blue-500 tw-text-blue-700 tw-font-semibold hover:tw-text-white tw-py-4 tw-px-6 tw-border tw-border-blue-500 hover:tw-border-transparent tw-rounded tw-no-underline hover:tw-no-underline">Next step</a>
</div>

<p>
    <br>
    <a href="{$moduleLink}" class="tw-absolute tw-bottom-0 tw-bg-transparent hover:tw-bg-sky-500 tw-text-sky-700 hover:tw-text-white tw-py-4 tw-px-6 tw-border tw-border-sky-500 hover:tw-border-transparent tw-rounded tw-no-underline hover:tw-no-underline">
        <i class="fa fa-arrow-left"></i>
        Back to home
    </a>
</p>

<script>
    function downloadPublicKey() {
        const content = `{$publicKey}`;
        const a = document.createElement('a');
        const blob = new Blob([content], { type: 'application/x-pem-file'});
        const url = URL.createObjectURL(blob);
        a.setAttribute('href', url);
        a.setAttribute('download', 'openbanking-reconciliation-wise-public.pem');
        a.click();
    }
</script>