<template>
  <div class="auth-login">
    <div class="row">
      <div class="col-md-6 col-sm-12 mx-auto">
        <div class="card">
          <div class="card-body">
            <h4 class="display-4 text-purple text-center">Register</h4>
            <hr class="card-divider" />
            <form class="mt-4" @submit.prevent>
              <div class="form-group">
                <label for="username" class="text-purple">Username</label>
                <input v-model="username" type="text" name="username" id="username" class="form-control" placeholder="Username" />
              </div>
              <div class="form-group">
                <label for="name" class="text-purple">Name</label>
                <input v-model="name" type="text" name="name" id="name" class="form-control" placeholder="Name" />
              </div>
              <div class="form-group">
                <label for="email" class="text-purple">Email</label>
                <input v-model="email" type="email" name="email" id="email" class="form-control" placeholder="Email" />
              </div>
              <div class="form-group">
                <label for="password" class="text-purple">Password</label>
                <input v-model="password" type="password" name="password" id="password" class="form-control" placeholder="Password" />
              </div>
              <div class="form-group">
                <label for="confirm_password" class="text-purple">Confirm Password</label>
                <input v-model="confirm_password" type="password" name="confirm_password" id="confirm_password" class="form-control" placeholder="Confirm Password" />
              </div>
              <button class="btn custom-btn custom-btn-purple">Register</button>
              <NuxtLink to="/auth/login" class="btn custom-btn custom-btn-dark">Login</NuxtLink>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name:"Register",
  data:() => ({
    name:"",
    email:"",
    username:"",
    password:"",
    confirm_password:""
  })
};
</script>
