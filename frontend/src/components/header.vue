<template>
  <nav class="navbar is-info" role="navigation" aria-label="main navigation">
    <div class="navbar-menu">
      <div class="navbar-start">
        <h1 class="navbar-item title">
          ToDo Application
        </h1>
      </div>

      <div class="navbar-end">
        <div class="navbar-item has-dropdown is-hoverable">
          <a class="navbar-link">
            Menu
          </a>
          <div class="navbar-dropdown is-right">
            <a class="navbar-item">
              <router-link to="/">
                Top
              </router-link>
            </a>
            <a class="navbar-item">
              <router-link to="/about">
                About
              </router-link>
            </a>
            <a class="navbar-item">
              <router-link to="/contact">
                Contact
              </router-link>
            </a>
          </div>
        </div>
      </div>
    </div>
  </nav>
</template>
