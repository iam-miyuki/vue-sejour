<script setup>
import { ref, computed } from "vue";
const typeHebergement = ref("default");
const withKayak = ref(false);
const withDraps = ref(false);
const petitDej = ref("");

const prixParType = {
  tente: 30,
  toile: 50,
  pierre: 100,
};

const prixTotal = computed(() => {
    
  let total = prixParType[typeHebergement.value] || 0;
  total += withKayak.value ? 30 : 0;
  total += withDraps.value ? 5 : 0;
  total += petitDej.value === "ouiPetitDej" ? 10 : 0;
  return total;

});
</script>

<template>
  <div>
    <div
      class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm"
    >
      <h5 class="my-0 mr-md-auto font-weight-normal">
        Notre Super Séjour dans les arbres
      </h5>
    </div>
    <div class="container">
      <div class="row">
        <div class="col-8">
          <div class="card mb-4 shadow-sm">
            <div class="card-header">
              <h4 class="my-0 font-weight-normal">Configurer votre séjour</h4>
            </div>
            <div class="card-body">
              <div class="row mb-2">
                <div class="col">
                  <input type="text" class="form-control" placeholder="Nom" />
                </div>
                <div class="col">
                  <input
                    type="text"
                    class="form-control"
                    placeholder="Prénom"
                  />
                </div>
              </div>
              <!-- Select   -->
              <label for="type">Type d'hebergement : </label>
              <select
                class="custom-select d-btypelock w-100"
                id="type"
                v-model="typeHebergement"
              >
                <option value="default">Choisissez...</option>
                <option value="tente">Emplacement Tentes</option>
                <option value="toile">Camp</option>
                <option value="pierre">Pierre</option>
              </select>
              <hr class="mb-4" />
              <!-- Checkboxes button  -->
              <h4 class="my-2">Les options de séjour</h4>
              <div class="custom-control custom-checkbox">
                <input
                  type="checkbox"
                  class="custom-control-input"
                  name="optionsSejour"
                  value="kayak"
                  id="ok-kayak"
                  v-model="withKayak"
                />
                <label class="custom-control-label" for="ok-kayak"
                  >Location Kayak (+30€)</label
                >
              </div>
              <div class="custom-control custom-checkbox">
                <input
                  type="checkbox"
                  class="custom-control-input"
                  name="optionsSejour"
                  value="draps"
                  id="ok-draps"
                  v-model="withDraps"
                />
                <label class="custom-control-label" for="ok-draps"
                  >Draps (+5€)
                </label>
              </div>
              <h4 class="mt-3">Petit Déjeuner {{ petitDej }}</h4>
              <div class="d-block my-3">
                <div class="custom-control custom-radio">
                  <input
                    id="ouiPetitDej"
                    value="ouiPetitDej"
                    name="petitDej"
                    type="radio"
                    class="custom-control-input"
                    v-model="petitDej"
                  />
                  <label class="custom-control-label" for="ouiPetitDej"
                    >Oui (+10€)</label
                  >
                </div>
                <div class="custom-control custom-radio">
                  <input
                    id="nonPetitDej"
                    value="nonPetitDej"
                    v-model="petitDej"
                    name="petitDej"
                    type="radio"
                    class="custom-control-input"
                  />
                  <label class="custom-control-label" for="nonPetitDej"
                    >Non</label
                  >
                </div>
              </div>
              <div class="alert alert-warning" role="alert">
                Erreur, merci de séléctionner un hébergement
              </div>
              <div class="mt-2">
                <button
                  id="submitButton"
                  type="button"
                  class="btn btn-lg btn-block btn-primary"
                >
                  Ok
                </button>
              </div>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="card" style="width: 18rem">
            <img
              :src="`./src/assets/img/${typeHebergement}.jpg`"
              class="card-img-top"
              alt=""
            />
            <div class="card-body">
              <h6 class="card-title text-center">{{ prixTotal }}€</h6>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped></style>
