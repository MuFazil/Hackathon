import { createRouter, createWebHistory } from "vue-router";
import SigninView from "../views/SigninView.vue";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      name: "signin",
      component: SigninView,
    },
    {
      path: "/register",
      name: "about",
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import("../views/SignupView.vue"),
    },
    {
      path: "/dashboard",
      name: "dash",
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import("../views/DashView.vue"),
    },
    {
      path: "/getPass/:contract",
      name: "Get Pass",
      component: () => import("../views/GetPass.vue"),
    },
  ],
});

export default router;
