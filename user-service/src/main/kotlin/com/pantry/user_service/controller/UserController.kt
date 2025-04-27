@RestController
@RequestMapping("/users")
class UserController(private val repo: UserRepository) {

    @GetMapping("/health")
    fun healthCheck() = "User service is up!"

    @PostMapping
    fun createUser(@RequestBody user: User): User = repo.save(user)

    @GetMapping("/{id}")
    fun getUser(@PathVariable id: Long): ResponseEntity<User> =
        repo.findById(id).map { ResponseEntity.ok(it) }
            .orElse(ResponseEntity.notFound().build())
}
