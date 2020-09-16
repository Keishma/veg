document.addEventListener("turbolinks:load", function() {

        $('#dismiss, .overlay').on('click', function () {
            $('#sidebar').removeClass('active');
            $('.overlay').removeClass('active');
        });

        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').addClass('active');
            $('.overlay').addClass('active');
            $('.collapse.in').toggleClass('in');
            $('a[aria-expanded=true]').attr('aria-expanded', 'false');
        });

        $('#search-icon').on('click', function () {
            $('#search-form').addClass('active');
        });
        $('#close-icon').on('click', function () {
            $('#search-form').removeClass('active');
            $('#search').val('');
        });
        $('#clear-icon').on('click', function () {
            $('#search').val('');
        });
    });