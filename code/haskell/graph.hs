import Data.Array
import Data.Graph

type Vertex = Int
type Table a = Array Vertex a
type Graph e = Table [(e,Vertex)]
type Bounds = (Vertex,Vertex)
type Edge e = (Vertex, e, Vertex)
type Labeling a = Vertex -> a

data LabGraph n e = LabGraph (Graph e) (Labeling n)

vertices (LabGraph gr _) = indices gr

labels (LabGraph gr l) = mabuildG :: Bounds -> [Edge e] -> Graph e
buildG bounds0 edges0 = accumArray (flip (:)) [] bounds0 [(v, (l,w)) | (v,l,w) <- edges0]p l (indices gr)

