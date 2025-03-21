{include file='base.tpl'}

<h2>Transactions</h2>
<p>Transactions are collected from the Bank's API after each cron run. If the connection fails, transactions might take
    a while to appear.</p>
<div class="row">
    <div class="col-md-6 col-sm-12">
        {$showing}
    </div>
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
<div class="row">
    <div class="col-md-6 col-md-offset-3 col-sm-12" style="text-align: center;">
        {$pagination}
    </div>
</div>

<form method="post">
    {$form}

    <div class="form-group">
        <label for="regex">Test Regex</label>
        <input id="regex" class="tw-bg-gray-50 tw-border tw-border-gray-300 tw-text-gray-900 tw-rounded-lg focus:tw-ring-blue-500 focus:tw-border-blue-500 tw-block tw-w-full tw-p-2.5" name="regex" value="{$regex}">
        <small class="form-text text-muted">Default: (#:?\s?\d+)(?!\/|\d|\-)</small>
    </div>
    <button type="submit" class="tw-bg-blue-500 hover:tw-bg-blue-600 tw-text-white tw-py-2 tw-px-4 tw-border tw-border-blue-500 hover:tw-border-transparent tw-rounded tw-no-underline hover:tw-no-underline">Test</button>
    <a href="{$moduleLink}&action=transactions">Reset view</a>
</form>

{include 'subfooter.tpl'}

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

    span.highlight-regex {

    }
</style>
