{include file='base.tpl'}

{if isset($licenseError)}
    <div class="errorbox"><strong><span class="title">Invalid License</span></strong><br>Please check the entered addon
        license key or <a href="https://procyonlabs.eu/contact-us" target="_blank">contact support.</a></div>
{/if}

{if isset($error)}
    <div class="errorbox"><strong><span class="title">Error</span></strong><br>{$error}</div>
{/if}

{if isset($connected)}
    <div class="successbox"><strong><span class="title">Success</span></strong><br>The account has been linked, please finish setup by clicking the button in the accounts table below.</div>
{/if}

<h2>Review transactions</h2>
<p>Transactions are automatically approved and assigned if the reference contains the invoice number, matching the
    currency and the invoice is unpaid. Other means of matching or if any of the previous requirement fails, the
    transaction requires manual approval.</p>
<form method="post" action="{$moduleLink}&action=massaction">
    <div class="tablebg">
        <table class="datatable" width="100%" border="0" cellspacing="1" cellpadding="3">
            <tbody>
            <tr>
                <th width="20"><input type="checkbox" id="checkall0"></th>
                <th>Date</th>
                <th>Account</th>
                <th>Amount</th>
                <th>Reference</th>
                <th>Information</th>
                <th width="100">Invoice ID</th>
                <th width="250">Actions</th>
            </tr>
            {foreach $reviews as $transaction}
                <tr>
                    <td width="20"><input type="checkbox" name="selected[]" value="{$transaction.id}" class="checkall">
                    </td>
                    <td>{$transaction.date}</td>
                    <td><span data-toggle="tooltip" data-placement="right"
                              title="{$transaction.transactionId}">{$transaction.accountNumber}</span></td>
                    <td>{$transaction.amount} {$transaction.currency}</td>
                    <td>{$transaction.reference}</td>
                    <td>{$transaction.information}</td>
                    <td>{$transaction.invoiceLink}</td>
                    <td>{$transaction.approveButton} {$transaction.assignButton} {$transaction.ignoreButton}</td>
                </tr>
                {foreachelse}
                <tr>
                    <td colspan="8" class="text-center">No Records Found</td>
                </tr>
            {/foreach}
            </tbody>
        </table>
    </div>

    With selected: <input type="submit" name="massignore" value="Ignore" class="tw-bg-red-500 hover:tw-bg-red-600 tw-text-white tw-py-2 tw-px-4 tw-border tw-border-red-500 hover:tw-border-transparent tw-rounded tw-no-underline hover:tw-no-underline">
</form>

{foreach $reviews as $transaction}
    <div class="modal fade" id="reviewModal{$transaction.id}" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <form method="get" action="{$moduleLink}">
                <div class="modal-content">
                    <div class="tw-flex tw-items-start tw-justify-between tw-p-5 tw-border-b tw-border-slate-200">
                        <span class="tw-text-gray-900 tw-text-xl tw-font-semibold" >
                            Assign transaction: {$transaction.transactionId}
                        </span>
                        <button type="button" class="close tw-text-gray-700 tw-bg-transparent hover:tw-bg-gray-200 hover:tw-text-gray-900 tw-rounded-lg tw-text-sm tw-p-1.5 tw-ml-auto tw-inline-flex tw-items-center" data-dismiss="modal" aria-label="Close">
                            <svg class="tw-w-8 tw-h-8" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                        </button>
                    </div>
                    <div class="tw-p-6 tw-space-y-6">
                        <b>Reference</b>: {$transaction.reference} <br>
                        <b>Additional info</b>: {$transaction.information} <br>
                        <b>Amount</b>: {$transaction.amount} {$transaction.currency} <br><br>

                        <input type="hidden" name="module" value="openbanking_reconciliation">
                        <input type="hidden" name="action" value="assigntransaction">
                        <input type="hidden" name="transaction_id" value="{$transaction.id}">
                        <input type="hidden" name="provider" value="{$transaction.provider}">
                        <div class="form-group">
                            <label for="invoice_id_{$transaction.id}" class="control-label">Select invoice</label>
                            <i>If you select multiple invoices, the amount has to match the invoice total</i>
                            <select id="invoice_id_{$transaction.id}" class="form-control select-invoice" name="invoice_ids[]" multiple>
                                <option></option>
                                {$invoiceList}
                            </select>
                        </div>
                    </div>
                    <div class="tw-flex tw-gap-4 tw-items-center tw-justify-end tw-p-6 tw-border-t tw-border-slate-200">
                        <button type="button" class="tw-bg-transparent hover:tw-bg-gray-100 tw-text-gray-700 tw-py-2 tw-px-3 tw-border tw-border-gray-500 tw-rounded tw-no-underline hover:tw-no-underline" data-dismiss="modal">Close</button>
                        <button type="submit" class="tw-bg-blue-500 hover:tw-bg-blue-600 tw-text-white tw-py-2 tw-px-3 tw-border tw-border-blue-500 hover:tw-border-transparent tw-rounded tw-no-underline hover:tw-no-underline">Assign transaction</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
{/foreach}

<h2 class="tw-mt-8">Recent transactions</h2>
<div class="tw-flex tw-justify-between">
    <p>Transactions are collected from the Bank's API after each cron run. If the connection fails, transactions might take
        a while to appear.</p>
    <p><a href="{$moduleLink}&action=transactions" class="tw-bg-transparent hover:tw-bg-blue-500 tw-text-blue-600 hover:tw-text-white tw-py-2 tw-px-4 tw-border tw-border-blue-500 hover:tw-border-transparent tw-rounded tw-no-underline hover:tw-no-underline">View all transactions</a></p>
</div>

<div class="tablebg">
    <table class="datatable" width="100%" border="0" cellspacing="1" cellpadding="3">
        <tbody>
        <tr>
            <th>Date</th>
            <th>Account</th>
            <th>Amount</th>
            <th>Reference</th>
            <th>Information</th>
            <th width="100">Invoice ID</th>
            <th width="100">Status</th>
        </tr>
        {foreach $transactions as $transaction}
            <tr>
                <td>{$transaction.date}</td>
                <td><span data-toggle="tooltip" data-placement="right"
                          title="{$transaction.transactionId}">{$transaction.accountNumber}</span></td>
                <td>{$transaction.amount} {$transaction.currency}</td>
                <td>{$transaction.reference}</td>
                <td>{$transaction.information}</td>
                <td>{$transaction.invoiceLink}</td>
                <td>{$transaction.status}</td>
            </tr>
            {foreachelse}
            <tr>
                <td colspan="7" class="text-center">No Records Found</td>
            </tr>
        {/foreach}
        </tbody>
    </table>
</div>

<h2 class="tw-mt-8">Bank Connections</h2>
<div class="tw-flex tw-justify-between">
    <p>You can view and manage your connected bank accounts below.</p>
    <p>
        <a href="{$moduleLink}&action=init" class="tw-bg-transparent hover:tw-bg-blue-500 tw-text-blue-600 hover:tw-text-white tw-py-2 tw-px-4 tw-border tw-border-blue-500 hover:tw-border-transparent tw-rounded tw-no-underline hover:tw-no-underline">
            <i class="fa fa-plus"></i>
            Add new bank connection
        </a>
    </p>
</div>

<div class="tablebg">
    <table class="datatable" width="100%" border="0" cellspacing="1" cellpadding="3">
        <tbody>
        <tr>
            <th>Bank Name</th>
            <th>Account Number</th>
            <th>Payment Gateway</th>
            <th>Last Sync</th>
            <th>Sync Suspended</th>
            <th width="100">Status</th>
            <th width="250">Actions</th>
        </tr>
        {foreach $accounts as $account}
            <tr>
                <td>
                    <img src="{$account.institution.logo}" class="institution-logo"><span
                            class="institution-name">{$account.institution.name}</span></a>
                </td>
                <td>{$account.number}</td>
                <td>{$account.gateway}</td>
                <td><span data-toggle="tooltip" data-placement="top" title="Schedule: {$account.scheduleText}">{$account.lastSync}</span></td>
                <td>{$account.suspended}</td>
                <td><span data-toggle="tooltip" data-placement="top"
                          title="{$account.statusLong}">{$account.status}</span></td>
                <td>
                    {$account.linkButton}
                    {$account.setupButton}
                    {$account.renewButton}
                    <a href="{$moduleLink}&action=delete&provider={$account.provider}&requisition_id={$account.requisitionId}&account_id={$account.id}"
                       class="tw-bg-red-500 hover:tw-bg-red-600 tw-text-white tw-py-2 tw-px-4 tw-border tw-border-red-500 hover:tw-border-transparent tw-rounded tw-no-underline hover:tw-no-underline">
                        Delete
                    </a>
                </td>
            </tr>
            {foreachelse}
            <tr>
                <td colspan="8" class="text-center">No Records Found</td>
            </tr>
        {/foreach}
        </tbody>
    </table>
</div>

<hr class="tw-h-px tw-my-8 tw-bg-gray-200 tw-border-0 tw-dark:bg-gray-700">

<div class="tw-flex">
    <a href="{$moduleLink}&action=diagnostics">Diagnostics</a>
</div>

<div class="modal fade" id="ignoreMass" tabindex="-1" role="dialog" aria-labelledby="ignoreMassLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content panel panel-primary">
            <div class="modal-header panel-heading">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                    <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title">Are you sure?</h4>
            </div>
            <div class="modal-body panel-body">
                Are you sure you want to ignore the selected transactions?
            </div>
            <div class="modal-footer panel-footer">
                <button type="button" id="acceptMass-cancel" class="tw-bg-transparent hover:tw-bg-gray-100 tw-text-gray-700 tw-py-2 tw-px-3 tw-border tw-border-gray-500 tw-rounded tw-no-underline hover:tw-no-underline" data-dismiss="modal">Close</button>
                <button type="submit" id="acceptMass-ok" class="tw-bg-red-500 hover:tw-bg-red-600 tw-text-white tw-py-2 tw-px-3 tw-border tw-border-red-500 hover:tw-border-transparent tw-rounded tw-no-underline hover:tw-no-underline">Assign transaction</button>
            </div>
        </div>
    </div>
</div>

<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<style>
    span.institution-name {
        margin-left: 1rem;
        font-weight: 600;
    }

    img.institution-logo {
        width: 100%;
        max-width: 3.5rem;
        height: 3.5rem;
        border-radius: 6px;
    }

    .tooltip-inner {
        max-width: 700px;
    }
</style>
<script>
    $(document).ready(function () {
        $('.select-invoice').select2({
            width: '100%',
            minimumInputLength: 1,
            ajax: {
                url: '{$moduleLink}&action=invoiceSearch',
                dataType: 'json'
            },
            theme: 'default'
        });

        $('#checkall0').click(function (event) {
            $(event.target).parents('.datatable').find('input').prop('checked', this.checked);
        });

        let name = '',
            selectedItems = '';
        jQuery(document)
            .on('click', "input[name='massignore']", function (event) {
                let massAction = '';
                selectedItems = $("input[name='selected[]']");
                name = jQuery(this).attr('name');
                switch (name) {
                    case 'massignore':
                        massAction = 'ignoreMass';
                        break;
                }

                if (selectedItems.filter(':checked').length === 0) {
                    event.preventDefault();
                    swal(
                        'Error',
                        'Please select transactions for any mass action.',
                        'error'
                    );
                } else {
                    event.preventDefault();
                    jQuery('#' + massAction).modal('show');
                }
            })
            .on('click', 'button[id$="Mass-ok"]', function (event) {
                event.preventDefault();
                let form = jQuery('input[name="' + name + '"]').closest('form');
                form.attr('action', function (i, value) {
                    return value + '&' + name + '=true'
                })
                form.submit();
            });
    });

    function confirmRenew(event) {
        let confirmed = confirm("WARNING! This will re-initialize the connection with GoCardless Bank Account Data, until you finish the link, no account sync will be performed. Account settings are kept the same.");
        if (!confirmed) {
            event.preventDefault();
        }
    }
</script>