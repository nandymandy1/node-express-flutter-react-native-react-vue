<template>
  <div class="auth-login">
    <div class="row">
      <div class="col-md-6 col-sm-12 mx-auto">
        <div class="card">
          <div class="card-body">
            <h4 class="display-4 text-purple text-center">Login</h4>
            <hr class="card-divider" />
            <form class="mt-4" @submit.prevent>
              <div class="form-group">
                <label for="username" class="text-purple">Username</label>
                <input v-model="username" type="text" name="username" id="username" class="form-control" placeholder="Username" />
              </div>
              <div class="form-group">
                <label for="password" class="text-purple">Password</label>
                <input v-model="password" type="password" name="password" id="password" class="form-control" placeholder="Password" />
              </div>
              <button class="btn custom-btn custom-btn-purple">Login</button>
              <NuxtLink to="/auth/register" class="btn custom-btn custom-btn-dark">Register Now</NuxtLink>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name:"Login",
  data:() => ({
    username:"",
    password:""
  })
};
</script>
