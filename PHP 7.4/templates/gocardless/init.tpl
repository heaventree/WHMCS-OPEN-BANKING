<link href="https://unpkg.com/nordigen-bank-ui@1.5.3/package/src/selector.min.css" rel="stylesheet" />

<h2>Connect a new bank account</h2>

<div id="institution-content-wrapper"></div>

<p>
    <br>
    <a href="{$moduleLink}" class="btn btn-info">
        <i class="fa fa-arrow-left"></i>
        Back to home
    </a>
</p>

<style>
    .institution-modal-close {
        display: none;
    }
</style>
<script src="https://unpkg.com/nordigen-bank-ui@1.5.3/package/src/selector.min.js"></script>
<script>
    const config = {
        redirectUrl: '',
        text: "Please select the main country of your bank. For international banks (like Wise) select a country where they operate.",
        logoUrl: '{$baseUrl}modules/addons/openbanking_reconciliation/assets/gocardless@4x.png',
        countryFilter: true,
    };

    new institutionSelector({$institutionList|@json_encode nofilter}, 'institution-modal-content', config);

    jQuery(document).ready(function(){
        const container = document.querySelector(".institution-container");
        const observer = new MutationObserver((event) => {
            console.log(event);
            const institutions = Array.from(document.querySelectorAll('.ob-list-institution > a'));
            institutions.forEach((institution) => {

                institution.addEventListener("click", (e) => {
                    e.preventDefault();
                    const aspspId = e.currentTarget.getAttribute('data-institution');
                    // custom redirect
                    window.location = '{$moduleLink}&action=connect&provider=gocardless&step=2&bank=' + aspspId;
                })
            })
        });

        const conf = {
            childList: true
        };
        observer.observe(container, conf);
    });
</script>