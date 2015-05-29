<?php

class RemoteJSON
{
	static public function getCachedData($url, $cacheTime = 1800)
	{
		if(!$data = Cache::fetch($url)) {
			$data = json_decode(file_get_contents($url), true);
			
			if(!empty($data['results'])) {
				Cache::store($url, $data, $ttl);
			}
		}
		
		return $data;
	}
}