<?php
/**
 * Custom footer for I-Dot Infra theme
 * Properly closes Astra's content wrappers, then renders custom footer.
 *
 * @package IdotInfra_Theme
 */

defined( 'ABSPATH' ) || exit;

$home_url = home_url( '/' );
$logo_id  = get_theme_mod( 'custom_logo' );
$logo_url = '';
if ( $logo_id ) {
    $logo_url = wp_get_attachment_image_url( $logo_id, 'medium' );
}
if ( ! $logo_url ) {
    $logo_url = get_stylesheet_directory_uri() . '/assets/logo.png';
}
?>

<?php astra_content_bottom(); ?>
	</div> <!-- ast-container -->
	</div><!-- #content -->
<?php astra_content_after(); ?>

<footer class="idot-footer">
    <div class="idot-footer-inner">
        <!-- Column 1: Logo + Description -->
        <div class="idot-footer-col">
            <div class="idot-footer-logo">
                <a href="<?php echo esc_url( $home_url ); ?>">
                    <img src="<?php echo esc_url( $logo_url ); ?>" alt="<?php echo esc_attr( get_bloginfo( 'name' ) ); ?>">
                </a>
            </div>
            <p>I-Dot Infra is a trusted real estate developer specializing in affordable residential and commercial projects in Bhadreswar, Hooghly. Building dreams with Trust, Opportunity, Dreams &amp; Innovation.</p>
            <div class="idot-footer-social">
                <a href="#" aria-label="Facebook"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/></svg></a>
                <a href="#" aria-label="Instagram"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zM12 0C8.741 0 8.333.014 7.053.072 2.695.272.273 2.69.073 7.052.014 8.333 0 8.741 0 12c0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98C8.333 23.986 8.741 24 12 24c3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98C15.668.014 15.259 0 12 0zm0 5.838a6.162 6.162 0 100 12.324 6.162 6.162 0 000-12.324zM12 16a4 4 0 110-8 4 4 0 010 8zm6.406-11.845a1.44 1.44 0 100 2.881 1.44 1.44 0 000-2.881z"/></svg></a>
                <a href="#" aria-label="YouTube"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M23.498 6.186a3.016 3.016 0 00-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 00.502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 002.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 002.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.545 15.568V8.432L15.818 12l-6.273 3.568z"/></svg></a>
                <a href="#" aria-label="LinkedIn"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"/></svg></a>
            </div>
        </div>

        <!-- Column 2: Quick Links -->
        <div class="idot-footer-col">
            <h4>Quick Links</h4>
            <ul>
                <li><a href="<?php echo esc_url( get_permalink( get_page_by_path( 'our-promise' ) ) ); ?>">Our Promise</a></li>
                <li><a href="<?php echo esc_url( get_permalink( get_page_by_path( 'terms-and-conditions' ) ) ); ?>">Terms &amp; Conditions</a></li>
                <li><a href="<?php echo esc_url( get_permalink( get_page_by_path( 'privacy-policy' ) ) ); ?>">Privacy Policy</a></li>
            </ul>
        </div>

        <!-- Column 3: Our Projects -->
        <div class="idot-footer-col">
            <h4>Our Projects</h4>
            <ul>
                <?php
                $footer_projects = new WP_Query( array(
                    'post_type'      => 'project',
                    'posts_per_page' => -1,
                    'orderby'        => 'menu_order',
                    'order'          => 'ASC',
                ) );
                if ( $footer_projects->have_posts() ) :
                    while ( $footer_projects->have_posts() ) : $footer_projects->the_post();
                ?>
                    <li><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></li>
                <?php
                    endwhile;
                    wp_reset_postdata();
                else :
                ?>
                    <li><a href="#">Shakuntala</a></li>
                    <li><a href="#">Anupama</a></li>
                    <li><a href="#">VishnuPriya</a></li>
                    <li><a href="#">BhitikaVilla</a></li>
                <?php endif; ?>
            </ul>
        </div>

        <!-- Column 4: Contact Info -->
        <div class="idot-footer-col">
            <h4>Contact Us</h4>
            <div class="idot-footer-contact-item">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/></svg>
                <span>Bhadreswar, Hooghly,<br>West Bengal, India</span>
            </div>
            <div class="idot-footer-contact-item">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M6.62 10.79c1.44 2.83 3.76 5.14 6.59 6.59l2.2-2.2c.27-.27.67-.36 1.02-.24 1.12.37 2.33.57 3.57.57.55 0 1 .45 1 1V20c0 .55-.45 1-1 1-9.39 0-17-7.61-17-17 0-.55.45-1 1-1h3.5c.55 0 1 .45 1 1 0 1.25.2 2.45.57 3.57.11.35.03.74-.25 1.02l-2.2 2.2z"/></svg>
                <span><a href="tel:+919999999999">+91 99999 99999</a></span>
            </div>
            <div class="idot-footer-contact-item">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M20 4H4c-1.1 0-1.99.9-1.99 2L2 18c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 4l-8 5-8-5V6l8 5 8-5v2z"/></svg>
                <span><a href="mailto:info@idotinfra.com">info@idotinfra.com</a></span>
            </div>
        </div>
    </div>

    <div class="idot-footer-bottom">
        <p>&copy; <?php echo esc_html( gmdate( 'Y' ) ); ?> I-Dot Infra. All Rights Reserved. | Trust, Opportunity, Dreams, Innovation</p>
    </div>
</footer>

	</div><!-- #page -->
<?php
	astra_body_bottom();
	wp_footer();
?>
</body>
</html>
