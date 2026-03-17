<?php
/**
 * Template Name: About Us
 * About page template for I-Dot Infra
 */
get_header();
?>

<!-- Hero -->
<section class="idot-project-hero" style="padding:60px 40px 50px;">
    <h1>About I-Dot Infra</h1>
    <p style="opacity:0.8;font-size:18px;max-width:600px;margin:10px auto 0;">Trust, Opportunity, Dreams, Innovation</p>
</section>

<!-- Company Story -->
<section class="idot-about-snippet" style="padding-top:60px;">
    <div class="about-image">
        <img src="<?php echo esc_url(get_stylesheet_directory_uri() . '/assets/logo.png'); ?>" alt="I-Dot Infra" style="padding:40px;background:#fff;">
    </div>
    <div class="about-text">
        <span class="idot-section-label">Our Story</span>
        <h2>Building Dreams Since Day One</h2>
        <p>I-Dot Infra is a reputed real estate development company based in Bhadreswar, Hooghly, West Bengal. We specialize in building affordable residential and commercial properties that cater to the aspirations of middle-class families looking for their dream homes.</p>
        <p>With a strong foundation built on Trust, Opportunity, Dreams, and Innovation, we have successfully delivered multiple housing projects that families proudly call home. Our developments are strategically located near railway stations, schools, hospitals, and commercial hubs, ensuring convenience and connectivity for our residents.</p>
    </div>
</section>

<!-- Vision & Mission -->
<section class="idot-section-alt">
    <div class="idot-section">
        <div style="display:grid;grid-template-columns:1fr 1fr;gap:40px;max-width:1000px;margin:0 auto;">
            <div style="background:#fff;padding:40px;border-radius:8px;box-shadow:0 3px 15px rgba(0,0,0,0.06);border-top:4px solid var(--idot-accent);">
                <h3 style="color:var(--idot-primary);font-size:24px;margin-bottom:15px;">Our Vision</h3>
                <p style="color:#555;line-height:1.8;">To be the most trusted name in affordable housing, creating communities where families thrive and grow, while setting new standards for quality construction in the region.</p>
            </div>
            <div style="background:#fff;padding:40px;border-radius:8px;box-shadow:0 3px 15px rgba(0,0,0,0.06);border-top:4px solid var(--idot-primary);">
                <h3 style="color:var(--idot-primary);font-size:24px;margin-bottom:15px;">Our Mission</h3>
                <p style="color:#555;line-height:1.8;">To deliver high-quality, thoughtfully designed homes at affordable prices, making homeownership accessible to all. We are committed to transparency, timely delivery, and customer satisfaction in every project we undertake.</p>
            </div>
        </div>
    </div>
</section>

<!-- Values -->
<section class="idot-section">
    <span class="idot-section-label">What We Stand For</span>
    <h2 class="idot-section-title">Our Core Values</h2>
    <p class="idot-section-subtitle">The principles that guide every project we build.</p>

    <div class="idot-usp-grid">
        <div class="idot-usp-item">
            <div class="usp-icon">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12 1L3 5v6c0 5.55 3.84 10.74 9 12 5.16-1.26 9-6.45 9-12V5l-9-4zm-2 16l-4-4 1.41-1.41L10 14.17l6.59-6.59L18 9l-8 8z"/></svg>
            </div>
            <h4>Trust</h4>
            <p>We build lasting relationships through transparency, integrity, and honest dealings with every customer.</p>
        </div>
        <div class="idot-usp-item">
            <div class="usp-icon">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-2 15l-5-5 1.41-1.41L10 14.17l7.59-7.59L19 8l-9 9z"/></svg>
            </div>
            <h4>Opportunity</h4>
            <p>We create opportunities for families to own their dream homes at prices that match their aspirations.</p>
        </div>
        <div class="idot-usp-item">
            <div class="usp-icon">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20v-6h4v6h5v-8h3L12 3 2 12h3v8z"/></svg>
            </div>
            <h4>Dreams</h4>
            <p>Every home we build is a dream realized. We put our heart into designing spaces that inspire happiness.</p>
        </div>
        <div class="idot-usp-item">
            <div class="usp-icon">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M9.4 16.6L4.8 12l4.6-4.6L8 6l-6 6 6 6 1.4-1.4zm5.2 0l4.6-4.6-4.6-4.6L16 6l6 6-6 6-1.4-1.4z"/></svg>
            </div>
            <h4>Innovation</h4>
            <p>We embrace modern construction techniques and thoughtful design to deliver homes that exceed expectations.</p>
        </div>
    </div>
</section>

<!-- Projects Counter -->
<section class="idot-cta">
    <div style="display:flex;justify-content:center;gap:80px;flex-wrap:wrap;margin-bottom:30px;">
        <div style="text-align:center;">
            <div style="font-size:48px;font-weight:800;color:var(--idot-accent);">4+</div>
            <div style="font-size:14px;text-transform:uppercase;letter-spacing:2px;opacity:0.8;">Projects Delivered</div>
        </div>
        <div style="text-align:center;">
            <div style="font-size:48px;font-weight:800;color:var(--idot-accent);">100+</div>
            <div style="font-size:14px;text-transform:uppercase;letter-spacing:2px;opacity:0.8;">Happy Families</div>
        </div>
        <div style="text-align:center;">
            <div style="font-size:48px;font-weight:800;color:var(--idot-accent);">10+</div>
            <div style="font-size:14px;text-transform:uppercase;letter-spacing:2px;opacity:0.8;">Years Experience</div>
        </div>
    </div>
    <a href="<?php echo esc_url(get_permalink(get_page_by_path('contact-us'))); ?>" class="idot-btn idot-btn-primary">Get In Touch</a>
</section>

<?php get_footer(); ?>
