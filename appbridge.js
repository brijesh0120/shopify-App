var AppBridge = window['app-bridge'];
var AppBridgeUtils = window['app-bridge-utils'];
var deepMerge = window['app-bridge/actions/merge'];
var createApp = AppBridge.createApp;
var getSessionToken = AppBridgeUtils.getSessionToken;
var ResourcePicker = AppBridge.actions.ResourcePicker;
var authenticatedFetch = AppBridgeUtils.authenticatedFetch;
var actions = AppBridge.actions;
var Redirect = actions.Redirect;
var Button = actions.Button;

// var shopify_app_url = `https://${shopOrigin}/admin/apps/{partner_app_name}/{project_name}/;


if( $action === "install" ) {
    const permissionUrl = `https://${shopOrigin}/admin/oauth/authorize?client_id=${api_key}&scope=write_products,read_products,read_customers,write_customers,read_script_tags,write_script_tags,read_inventory,write_inventory,read_locations&redirect_uri=${redirect_uri}`;
    window.location.assign(permissionUrl);
}

console.log(`API Key: '${api_key}' with p_value '${p_value}'`);
const app = createApp({
    apiKey: api_key,
    host: hostname,
    forceRedirect: true // in case of app opening without iframe, this option sets allow access origin by Shopify ***
});

var sessionToken = getSessionToken(app).then(result => {
    // if needed, Add authentication headers as params
    if(p_value == 'abloading') {
        const params = new URLSearchParams({
            p: 'homepage',
            stoken: result,
            shop: shopOrigin
        });
        // Redirect.create(app).dispatch(Redirect.Action.REMOTE, shopify_app_url+'index.php?'+params.toString());
        window.location.assign('index.php?'+params.toString());
    }
    /*
    else {
        const params = new URLSearchParams({
            stoken: result,
            shop: shopOrigin
        });
        $("a.wk_abload").on('click', function(e){
            let cur_href = $(this).attr('href');
            if(cur_href.indexOf('stoken') === -1) {
                let a_href = cur_href+'&'+params.toString();
                $(this).attr('href', a_href);
            }
            return true;
        });
        
        $("form.wk_modal_form").on('submit', function(e){
            let cur_action = $(this).attr('action');
            if(cur_action.indexOf('stoken') === -1) {
                let form_action = cur_action+'&'+params.toString();
                $(this).attr('action', form_action);
            }
            return true;
        });
    }
    */
})
.catch(err => { 
    console.log("Not getting sToken: ",err);
});

// If the current window is the 'parent', change the URL by setting location.href
// if (window.top == window.self) {
//      alert("Hrllo 1");
// //    window.location.assign(permissionUrl);
// } else { // If the current window is the 'child', change the parent's URL with Shopify App Bridge's Redirect action
//   alert('Hello 2');
//   var app = createApp({
//     apiKey: apiKey,
//     shopOrigin: shopOrigin,
//     forceRedirect: false
//   });

//   Redirect.create(app).dispatch(Redirect.Action.REMOTE, permissionUrl);
// }

