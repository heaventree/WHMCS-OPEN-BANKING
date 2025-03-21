{include file='base.tpl'}

<form method="post">
    {$form}

    <div class="tw-flex tw-gap-8">
        <div class="tw-basis-2/6 tw-flex tw-flex-col tw-gap-4">
            <div>
                <h2>Accounts</h2>
                <p>Below you can select the payment method for each account for the current data provider.</p>
                {foreach $accounts as $account}
                    <div class="form-group">
                        <label class="tw-block tw-text-gray-700 tw-font-bold mb-2" >
                            {$account.iban}
                        </label>
                        <select class="tw-bg-gray-50 tw-border tw-border-gray-300 tw-text-gray-900 tw-rounded-lg focus:tw-ring-blue-500 focus:tw-border-blue-500 tw-block tw-w-full tw-p-2.5" name="gateway[{$account.id}]" required>{$paymentMethodSelect}</select>
                    </div>
                {/foreach}
            </div>

            <div>
                <h2>Raw Transaction list</h2>
                <p>To help with the data mapping, you can see the raw response from the data provider below.</p>
                <textarea rows="15" cols="100" disabled>{$transactions}</textarea>
            </div>

            <div>
                <h2>Other configuration options</h2>
            </div>
            <div class="form-group">
                <label for="schedule">Schedule</label>
                <input id="schedule" class="tw-bg-gray-50 tw-border tw-border-gray-300 tw-text-gray-900 tw-rounded-lg focus:tw-ring-blue-500 focus:tw-border-blue-500 tw-block tw-w-full tw-p-2.5" name="schedule" required>
                <small class="form-text text-muted">You can set the schedule in cron format to fetch the bank APIs differently from the WHMCS Cron. Default value is <strong>* * * * *</strong>. You can set for example <strong>*/15 * * * *</strong> to only fetch APIs every 15 minutes, lowering the possibility of suspension in case of API failures.</small>
            </div>
        </div>
        <div class="tw-flex tw-flex-col  tw-grow">
            <div>
                <h2>Data mapping</h2>
                <p>Map the values from your bank's API. Date, unique reference is mandatory, the transaction's amount is a fixed field.</p>
            </div>
            <div class="form-group">
                <label for="transaction_id">Transaction ID *</label>
                <select id="transaction_id" class="tw-bg-gray-50 tw-border tw-border-gray-300 tw-text-gray-900 tw-rounded-lg focus:tw-ring-blue-500 focus:tw-border-blue-500 tw-block tw-w-full tw-p-2.5" name="mapping[transaction_id]" required>{$fieldSelector}</select>
                <small class="form-text text-muted">Recommended: referenceNumber</small>
            </div>
            <div class="form-group">
                <label for="date">Date *</label>
                <select id="date" class="tw-bg-gray-50 tw-border tw-border-gray-300 tw-text-gray-900 tw-rounded-lg focus:tw-ring-blue-500 focus:tw-border-blue-500 tw-block tw-w-full tw-p-2.5" name="mapping[date]" required>{$fieldSelector}</select>
                <small class="form-text text-muted">Recommended: date</small>
            </div>
            <div class="form-group">
                <label for="reference">Reference *</label>
                <select id="reference" class="tw-bg-gray-50 tw-border tw-border-gray-300 tw-text-gray-900 tw-rounded-lg focus:tw-ring-blue-500 focus:tw-border-blue-500 tw-block tw-w-full tw-p-2.5" name="mapping[reference]" required>{$fieldSelector}</select>
                <small class="form-text text-muted">This field is used for invoice number checks. Recommended: details.description</small>
            </div>
            <div class="form-group">
                <label for="bank_reference">Bank Reference ID</label>
                <select id="bank_reference" class="tw-bg-gray-50 tw-border tw-border-gray-300 tw-text-gray-900 tw-rounded-lg focus:tw-ring-blue-500 focus:tw-border-blue-500 tw-block tw-w-full tw-p-2.5" name="mapping[bank_reference]">{$fieldSelector}</select>
                <small class="form-text text-muted">Recommended: referenceNumber</small>
            </div>
            <div class="form-group">
                <label for="information">Additional information</label>
                <select id="information" class="tw-bg-gray-50 tw-border tw-border-gray-300 tw-text-gray-900 tw-rounded-lg focus:tw-ring-blue-500 focus:tw-border-blue-500 tw-block tw-w-full tw-p-2.5" name="mapping[information]">{$fieldSelector}</select>
                <small class="form-text text-muted">Recommended: details.senderName</small>
            </div>
        </div>
    </div>
    <div class="tw-flex tw-justify-end tw-gap-4">
        <a href="{$moduleLink}" class="tw-bg-transparent hover:tw-bg-sky-500 tw-text-sky-700 hover:tw-text-white tw-py-4 tw-px-6 tw-border tw-border-sky-500 hover:tw-border-transparent tw-rounded tw-no-underline hover:tw-no-underline">
            <i class="fa fa-arrow-left"></i>
            Back to home
        </a>
        <button type="submit" class="tw-bg-sky-500 tw-text-white hover:tw-bg-sky-600 tw-shadow tw-py-4 tw-px-6 tw-border tw-border-sky-500 hover:tw-border-transparent tw-rounded tw-no-underline hover:tw-no-underline">Save</button>
    </div>
</form>
