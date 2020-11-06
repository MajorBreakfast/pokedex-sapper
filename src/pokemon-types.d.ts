export interface PokemonList {
  count: number
  results: {
    name: string
    url: string
  }[]
}

export interface Pokemon {
  name: string
  weight: number
  sprites: {
    front_default: string
  }
  types: {
    type: {
      name: string
    }
  }[]
}
