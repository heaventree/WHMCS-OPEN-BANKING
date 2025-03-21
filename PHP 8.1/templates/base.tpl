<script src="https://cdn.tailwindcss.com"></script>
<script>
    tailwind.config = {
        prefix: 'tw-',
        theme: {
            fontSize: {
                sm: ['12px', '20px'],
                base: ['14px', '22px'],
                lg: ['16px', '24px'],
                xl: ['20px', '28px'],
            }
        },
        corePlugins: {
            preflight: false,
        },
        important: true,
    }
</script>

<style>
    h1 {
        margin: 0 0 20px 0;
        color: #333;
        font-size: 1.4em;
        font-weight: 400;
    }

    #contentarea *,
    #contentarea ::before,
    #contentarea :after {
        border-width: 0;
        border-style: solid;
    }

    #contentarea button,
    #contentarea input,
    #contentarea optgroup,
    #contentarea select,
    #contentarea textarea {
        font-family: inherit; /* 1 */
        font-feature-settings: inherit; /* 1 */
        font-variation-settings: inherit; /* 1 */
        font-size: 100%; /* 1 */
        font-weight: inherit; /* 1 */
        line-height: inherit; /* 1 */
        color: inherit; /* 1 */
        margin: 0; /* 2 */
        padding: 0; /* 3 */
    }

    #contentarea button,
    #contentarea select {
        text-transform: none;
    }

    #contentarea button,
    #contentarea [type='button'],
    #contentarea [type='reset'],
    #contentarea [type='submit'] {
        -webkit-appearance: button; /* 1 */
        background-color: transparent; /* 2 */
        background-image: none; /* 2 */
    }

    #contentarea table.datatable td {
        padding: 3px;
        background-color: #fff;
        border-bottom: 1px solid #ebebeb;
    }

    #contentarea table.datatable tr:not(.detail-row):hover td {
        background-color: #eff2f9;
    }
</style>

<style type="text/tailwindcss">
    .select2-container {
        /* The container where the selectbox is housing*/
        @apply tw-relative tw-box-border tw-align-middle tw-inline-block tw-m-0 tw-mb-2;
    }
    .select2-container .select2-selection--single {
        /* Selection box itself */
        @apply tw-box-border tw-cursor-pointer tw-block tw-select-none tw-shadow tw-border tw-rounded;
    }

    .select2-container .select2-selection--single .select2-selection__rendered {
        /* DIV inside Selection box with text, clear button and arrow down*/
        @apply tw-block tw-h-6 tw-pl-1 tw-pr-6 tw-truncate;
    }
    .select2-container .select2-selection--single .select2-selection__clear {
        /* The DIV where the X is housing to clear the chosen option */
        @apply tw-relative tw--m-1;
    }
    .select2-container[dir="rtl"] .select2-selection--single .select2-selection__rendered {
        /*@apply;*/
    }

    .select2-container .select2-selection--multiple {
        @apply tw-box-border tw-overflow-hidden tw-h-4 tw-cursor-pointer tw-block tw-select-none tw-border tw-border-slate-400 !important;
    }

    .select2-container .select2-selection--multiple .select2-selection__rendered {
        @apply tw-inline-block tw-pl-2 tw-truncate tw-whitespace-nowrap;
    }
    .select2-container .select2-search--inline {
        /* Search box*/
        @apply tw-float-left;
    }
    .select2-container .select2-search--inline .select2-search__field {
        @apply tw-box-border tw-border tw-pl-1 tw-my-1 tw-w-full tw-text-base;
    }
    .select2-container .select2-search--inline .select2-search__field::-webkit-search-cancel-button {
        @apply tw-appearance-none;
    }

    .select2-dropdown {
        /* Dropdown area after the arrow down is clicked */
        @apply tw-absolute tw-block tw-w-auto tw-box-border tw-bg-white tw-border-solid tw-border tw-border-slate-200 tw-z-50 tw-float-left;
    }

    .select2-results {
        @apply tw-block tw-text-black ;
    }

    .select2-results__options {
        @apply tw-list-none tw-m-0 tw-p-0;
    }

    .select2-results__option {
        /* The rows with results that you see after dropdown.
        Increase p-1 to p-2 to have more space between results */
        @apply tw-p-1 tw-select-none;
    }
    .select2-results__option[aria-selected] {
        @apply tw-cursor-pointer;
    }

    .select2-container--open .select2-dropdown--above {
        /* The left and right tw-borders of the option rows */
        @apply tw-rounded tw-border-gray-400 tw-shadow;
    }

    .select2-container--open .select2-dropdown--below {
        /* The left and right tw-borders of the option rows */
        @apply tw-rounded tw-border-gray-400 tw-shadow;
    }

    .select2-search--dropdown {
        /* Search dropdown element*/
        @apply tw-block tw-p-2;
    }
    .select2-search--dropdown .select2-search__field {
        /* Search box itself where you can enter text*/
        @apply tw-h-10 tw-p-1 tw-bg-white tw-box-border tw-rounded tw-border-2 tw-border-blue-300 tw-outline-none;
        width: 100%;
    }
    .select2-search--dropdown .select2-search__field::-webkit-search-cancel-button {
        @apply tw-appearance-none;
    }
    .select2-search--dropdown.select2-search--hide {
        @apply tw-hidden;
    }

    .select2-close-mask {
        @apply tw-block tw-w-12 tw-min-w-full tw-m-0 tw-p-0;
        border: 0;
        position: fixed;
        left: 0;
        top: 0;
        min-height: 100%;
        height: auto;
        width: auto;
        opacity: 0;
        z-index: 99;
        background-color: #fff;
        filter: alpha(opacity=0);
    }

    .select2-hidden-accessible {
        border: 0 !important;
        clip: rect(0 0 0 0) !important;
        -webkit-clip-path: inset(50%) !important;
        clip-path: inset(50%) !important;
        height: 1px !important;
        overflow: hidden !important;
        padding: 0 !important;
        position: absolute !important;
        width: 1px !important;
        white-space: nowrap !important; }
    

    .select2-container--default .select2-selection--single {
        /* Selection bar - Self */
        @apply tw-p-2 tw-h-10 tw-bg-white tw-border tw-border-solid ;
    }
    .select2-container--default .select2-selection--single .select2-selection__rendered {
        /* Selection bar - Text color of the item you selected from the results */
        @apply tw-text-gray-700 ;
    }

    .select2-container--default .select2-selection--single .select2-selection__clear {
        /* Selection bar - Clear button - If this property is enabled*/
        @apply tw-cursor-pointer tw-float-right tw-text-red-700;
    }
    .select2-container--default .select2-selection--single .select2-selection__placeholder {
        /* Selection bar - Color of the placeholder text before selection - If this property is enabled */
        @apply tw-text-gray-600 ;
    }
    .select2-container--default .select2-selection--single .select2-selection__arrow {
        /* Selection bar - DIV where the arrow pointing down is living*/
        @apply tw-absolute tw-right-0 tw-top-0 tw-h-10 tw-w-8;
    }
    .select2-container--default .select2-selection--single .select2-selection__arrow b {
        /* Arrow is a CSS triangle that does not exists in Tailwind without a package */
        @apply tw-absolute tw-border-solid tw-h-0 tw-w-0 tw-border-t-4 tw-border-r-4 tw-border-b-0 tw-border-l-4;
        tw-border-color: #000 transparent transparent transparent;
        left: 50%;
        margin-left: -4px;
        margin-top: -2px;
        top: 50%;
    }

    .select2-container--default[dir="rtl"] .select2-selection--single .select2-selection__clear {
        /* Selection bar - Clear button - If this property is enabled from right to left*/
        @apply tw-float-left tw-ml-4;
    }

    .select2-container--default[dir="rtl"] .select2-selection--single .select2-selection__arrow {
        /* Placement of the dropdown arrow when in rtl mode */
        @apply tw-left-0 tw-right-auto;
    }

    .select2-container--default.select2-container--disabled .select2-selection--single {
        /* Selection by property disabled*/
        @apply tw-cursor-default tw-bg-gray-300;
    }
    .select2-container--default.select2-container--disabled .select2-selection--single .select2-selection__clear {
        /* Selection bar - Hide the clear cross when selection bar is disabled*/
        @apply tw-hidden;
    }

    .select2-container--default.select2-container--open .select2-selection--single .select2-selection__arrow b {
        border-color: transparent transparent #888 transparent;
        border-width: 0 4px 5px 4px;
    }

    .select2-container--default .select2-selection--multiple {
        @apply tw-p-1 tw-min-h-full tw-h-full tw-border tw-border-solid tw-rounded tw-shadow tw-bg-white ;
    }

    .select2-container--default .select2-selection--multiple .select2-selection__rendered {
        @apply tw-box-border tw-list-none tw-m-0 tw-px-1 tw-min-w-full;
    }
    .select2-container--default .select2-selection--multiple .select2-selection__rendered li {
        @apply tw-list-none;
    }
    .select2-container--default .select2-selection--multiple .select2-selection__clear {
        @apply tw-float-right tw-cursor-pointer tw-mt-1 tw-mr-2 tw-p-1;
    }
    .select2-container--default .select2-selection--multiple .select2-selection__choice {
        @apply tw-bg-white tw-text-gray-700 tw-border tw-cursor-default tw-rounded tw-my-1 tw-mr-1 tw-px-4 tw-float-left;
    }
    .select2-container--default .select2-selection--multiple .select2-selection__choice__remove {
        @apply tw-text-gray-700 tw-cursor-pointer tw-inline-block tw-mr-1;
    }
    .select2-container--default .select2-selection--multiple .select2-selection__choice__remove:hover {
        @apply tw-text-gray-700 ;
    }
    .select2-container--default.select2-container--focus .select2-selection--multiple {
        @apply tw-border-2 tw-outline-none;
    }

    .select2-container--default.select2-container--disabled .select2-selection__choice__remove {
        @apply tw-hidden;
    }
    .select2-container--default .select2-search--dropdown .select2-search__field {
        /* The tw-border of the search textbox */
        @apply tw-border-solid;
    }

    .select2-container--default .select2-search--inline .select2-search__field {
        /* Search textbox */
        @apply tw-border-none tw-bg-transparent tw-outline-none tw-shadow-none tw-select-text;
    }

    .select2-container--default .select2-results > .select2-results__options {
        /* Hight of the dropdown zone where the options or results are visible */
        @apply tw-h-full tw-max-h-32 tw-overflow-y-auto;
    }

    .select2-container--default .select2-results__option[role=group] {
        /* No clue what this does */
        @apply tw-p-0;
    }

    .select2-container--default .select2-results__option[aria-disabled=true] {
        @apply tw-text-gray-700;
    }

    .select2-container--default .select2-results__option[aria-selected=true] {
        /* The already selected option row color */
        @apply tw-bg-gray-300 ;
    }
    .select2-results__option--selected {
        @apply tw-hidden;
    }
    .select2-container--default .select2-results__option .select2-results__option {
        padding-left: 1em;
    }
    .select2-container--default .select2-results__option .select2-results__option .select2-results__group {
        padding-left: 0;
    }
    .select2-container--default .select2-results__option .select2-results__option .select2-results__option {
        margin-left: -1em;
        padding-left: 2em;
    }
    .select2-container--default .select2-results__option .select2-results__option .select2-results__option .select2-results__option {
        margin-left: -2em;
        padding-left: 3em;
    }
    .select2-container--default .select2-results__option .select2-results__option .select2-results__option .select2-results__option .select2-results__option {
        margin-left: -3em;
        padding-left: 4em;
    }
    .select2-container--default .select2-results__option .select2-results__option .select2-results__option .select2-results__option .select2-results__option .select2-results__option {
        margin-left: -4em;
        padding-left: 5em;
    }
    .select2-container--default .select2-results__option .select2-results__option .select2-results__option .select2-results__option .select2-results__option .select2-results__option .select2-results__option {
        margin-left: -5em;
        padding-left: 6em;
    }

    .select2-container--default .select2-results__option--highlighted[aria-selected] {
        /* Background color and text color of the options rows when select is open */
        @apply tw-bg-gray-100 tw-text-gray-700 ;
    }

    .select2-container--default .select2-results__group {
        /* Have no idea what this is for */
        @apply tw-cursor-default tw-block;
        padding: 6px;
    }
    
</style>

{if $formErrors}
    <div class="errorbox"><strong><span class="title">Form Errors</span></strong><br><ul>
        {foreach $formErrors as $formError}
            <li>{$formError}</li>
        {/foreach}
        </ul>
    </div>
{/if}
