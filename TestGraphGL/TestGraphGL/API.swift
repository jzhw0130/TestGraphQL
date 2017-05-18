//  This file was automatically generated and should not be edited.

import Apollo

public final class MyPostQuery: GraphQLQuery {
  public static let operationDefinition =
    "query MyPost {" +
    "  posts {" +
    "    __typename" +
    "    id" +
    "    title" +
    "    votes" +
    "    author {" +
    "      __typename" +
    "      firstName" +
    "      lastName" +
    "    }" +
    "  }" +
    "}"
  public init() {
  }

  public struct Data: GraphQLMappable {
    public let posts: [Post]

    public init(reader: GraphQLResultReader) throws {
      posts = try reader.list(for: Field(responseName: "posts"))
    }

    public struct Post: GraphQLMappable {
      public let __typename: String
      public let id: Int
      public let title: String?
      public let votes: Int?
      public let author: Author?

      public init(reader: GraphQLResultReader) throws {
        __typename = try reader.value(for: Field(responseName: "__typename"))
        id = try reader.value(for: Field(responseName: "id"))
        title = try reader.optionalValue(for: Field(responseName: "title"))
        votes = try reader.optionalValue(for: Field(responseName: "votes"))
        author = try reader.optionalValue(for: Field(responseName: "author"))
      }

      public struct Author: GraphQLMappable {
        public let __typename: String
        public let firstName: String?
        public let lastName: String?

        public init(reader: GraphQLResultReader) throws {
          __typename = try reader.value(for: Field(responseName: "__typename"))
          firstName = try reader.optionalValue(for: Field(responseName: "firstName"))
          lastName = try reader.optionalValue(for: Field(responseName: "lastName"))
        }
      }
    }
  }
}