Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA881CD5AC
	for <dtrace@lists.linux.dev>; Tue,  2 Jul 2024 19:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719946809; cv=fail; b=DWI2wbSKl27ZaxIdn9GHvCU1nhGlONErQ9O/kIYQyaYPAtqmB0bHuWqApgLyLh11/oBiIzwFa5XoHUQVAwhg4pHii+UGTIgDWb2jXwlN0hU1QVsi5PFtf4EUGiHViWaobOnnc44SJYzE8mZbKnlRjBt8B6tviPzM4zfCiXi0hzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719946809; c=relaxed/simple;
	bh=dZ/XgS0yFJVE9JlNMXwM0rPoubqkUmAUxpJbtekIpn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MYTsJu74UtHOph7qhsSN2GZZCgv7NxVar1mMZdi03/jycMKUIeC6THmgat4lO4eqZdXsePuI8q6qNnWpzkEvvtug2geKucLaOjpO7bO4j1hex2YZm26t6rYcUdm39fYVTB2FFdZtRiY87vBYX6Cdy1Cv5hCL7t4D/nvtxSmtxiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IzFe5oKv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WqZH5qfU; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IzFe5oKv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WqZH5qfU"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 462HfZ9g006526
	for <dtrace@lists.linux.dev>; Tue, 2 Jul 2024 19:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=QKE2/kr3+zJEHfw
	n9QUIAoivXSZFWXm0GiO7vhp7WJE=; b=IzFe5oKvWc5rwXnH1lnOTczA8tr39DT
	2TErmRb+fzbWFZuNA8wjxLTIZ7ETqs5KNRMakDIfTOxeAedX74XFQwJy6qv0f34S
	I2SKG36LMumo63/6cyo1OonRFyyCLFEKpnABlfkP1zFIddXzhIoTWL0pzzV5Zh/X
	nls0UeRLuW3pjJu1nzdCaxVLhuNLUPLezy14QnBthMzVtY3uzbs9fFGgLsP4lGC3
	w9aWLEIIMIu2gvthp8AcYNzIDdCguhLd2mE4XwnJdsdW1XOJCSTxqozkXZi8gkWd
	70ewGEPXJlHcR3VxnAcYR3O6dnyYjnk4NCQyE8KfI2Fo8j6n8cZa7pQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4028v0pp78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 02 Jul 2024 19:00:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 462I55aR010299
	for <dtrace@lists.linux.dev>; Tue, 2 Jul 2024 19:00:00 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4028qek60a-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 02 Jul 2024 19:00:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NQzh1Qv2pUG5JP1Eab1aiTKdvZTcyTr/W38VXnCoImWuZuVcN+Zz84zV8G3H7CFH1UXggcftgsp0yPKq99ILiJZsR3wIr7ATK0o03BDXKg5M7uNWS0m+nRzMGPyvuOCrTEInx0kTntH60p7gJmNMVcMTunKPehQvmcAV15SLXuGBVHcGUMv/nGjCkKioQCpufRENdEKy8IaDtFo1splDa+tTqNELrQIyelJMbMk8PVwT/CGqx+W46PlKHy9/dARbcZYHbpPKPBanNAAFly3KViAa7NPYXyXloIDyOlZcx+7L7039XX/+DDhkSOPgWIWN/lfkqchiIc2nBVgX1P2UdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKE2/kr3+zJEHfwn9QUIAoivXSZFWXm0GiO7vhp7WJE=;
 b=mgtr53aMP6XMiIxefq+v6eXWpkN3YTEXcluURNmJ5evl7R/uSdPTTJ3AlSKm0UaywMgXsPjt5naAxGrQDq0cg6sHmsvGEh9ZyFJtVW16ddtClcZGuhuLrzif+1r8EWMQBRBnixSBzVDpzZ/52uR2rY/zbnfeZYaysCz0ufg4vRhXjGARyuRksJZOdkyA6rjp255KOOoH4/C7SYgRPp0XhbrPOa7XfyIp2zFORGAK9nRsPvHGsznU0LT/UoJZwcJs+O0PG7pLPLwTFgS6fX5Yli1IIqsXfjReOdG2IVcCgwg26lPxb8ulsWztigzNGuUjnSYOTvh9YpJk+Rqr5U3hwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKE2/kr3+zJEHfwn9QUIAoivXSZFWXm0GiO7vhp7WJE=;
 b=WqZH5qfUZ5RRzMaieE8JA93bewI6GSMo7APt39iXEwg2Hmy7SJpQ+OcZiBwHKNyvMMxOaG4JRYglbnM4zvl5udg67CY8kB5hG8L6Vk3+wsrB+LoA6H0cVr/3AXKPYJUy3j/2++SaOQnMZo+ZOXQ4rVDQws39StWHDlML52Ix+K8=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH7PR10MB6601.namprd10.prod.outlook.com (2603:10b6:510:205::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Tue, 2 Jul
 2024 18:59:57 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7719.022; Tue, 2 Jul 2024
 18:59:57 +0000
Date: Tue, 2 Jul 2024 14:59:54 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3 1/2] print() action: identify ctf object used for print
Message-ID: <ZoROKlfr5tnaBRVO@oracle.com>
References: <20240426133327.578092-1-alan.maguire@oracle.com>
 <Zn8xVd+r8SzmLGH9@oracle.com>
 <9fd33071-54a9-497e-ae90-4daa63eafad0@oracle.com>
 <ZoLeWRMOnCoecHmx@oracle.com>
 <2b83e5e2-adf1-4a5b-abf8-a83fbaf65abe@oracle.com>
 <ZoLrt+Q/DWf6K9q4@oracle.com>
 <2630cd6e-0f7d-4a05-a711-85d251045b13@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2630cd6e-0f7d-4a05-a711-85d251045b13@oracle.com>
X-ClientProxiedBy: BYAPR11CA0091.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::32) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH7PR10MB6601:EE_
X-MS-Office365-Filtering-Correlation-Id: 775cfff4-bf7f-45d6-6c58-08dc9ac92a66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pvo0SJ9zHVwXjUjHRBdrkEORr07W0SxWF6oGOPRCzKrDYN3k65vhMqhRLIWe?=
 =?us-ascii?Q?Ncq1gfH7jjsQTeBeaoyEYLBZa9lWR5rjWTPfLTf7CdUxtinv9vdVWzy3whLy?=
 =?us-ascii?Q?XPqmQd05JSSkW4u1mYhJ1J4EZ7QKhFy9o3SfOOcMVDaOlnCFAQkLgCzZIkeK?=
 =?us-ascii?Q?WIeeU5fzcv65/mgen7glxL1sH+8KdczGjcgsQ5lmbIuHVXU3BV5Mzi2EuIw/?=
 =?us-ascii?Q?Kqe2yo5ikJZQ8yLpCaB2cIco/vcFQto1V+a2C/r/ouCkTC8RMg6RuHq0CHIq?=
 =?us-ascii?Q?vxlr1DTi4XlNvxp+kX6IIYRNmsfsdHZSI0v9ZpWvOBjeNIkeqVAgF/uGt5oo?=
 =?us-ascii?Q?c63hkcwPHhRaErGVuG8/pKOgItXf64yabWiXBWAy92Q1U9rzDt8806VwYQe7?=
 =?us-ascii?Q?sYc6MQKk9gYoZJhmyaQUXTN9ivAL59pZJXa+2ZJtXBQDr/1X7XA+JyxiBFqN?=
 =?us-ascii?Q?zaoQKEEj4i2hTajVACa5yqdEhw9CTvft19Q5ESw5Qd2yHVcc7Yg2ZV2gUGIS?=
 =?us-ascii?Q?bkHJwgrs3tp8fqibBBq/SWamtnPB3A7kpfN+HKHKrcyi2TflUMcwF94wcbip?=
 =?us-ascii?Q?3ol7b363cTnNfiJzFD4vVt5J5JER7YVZ1teJAYnAL+zfq6ckfxO7dqLWrKn1?=
 =?us-ascii?Q?85HSvl6L/L6nT8+jPuuzf55oHyGJzXp+wwgmHx6nZK4lQAFfNW2B3LCUR/F/?=
 =?us-ascii?Q?ER0Q2lzpuNRrEhqobTPArCcN9A1O30Ss0tTQkv0nmVcW0mluM31ivGbbnxa7?=
 =?us-ascii?Q?xXIjhHAThbyDzUVEuDOb1V/3RmJ+ytpU89xVjRYtmdtr8yDVSknCWStUxanA?=
 =?us-ascii?Q?dS8wb6io0nwPydYFDNJLM1FF2CW4zpcnGrRaHTNTTmbMme8/y1Enq8GIO8Zh?=
 =?us-ascii?Q?zgocmVl/ja2dlN5NR9uYLUdkCXr3VKrO6iESjF4XTHI23lBEU9W1j/mM95rN?=
 =?us-ascii?Q?9AxNGKgYebckSiPILStkuPKCRRvS6gMhzKWvE06BVTGJVRRPMcVGc9vIb1YH?=
 =?us-ascii?Q?znfsYJgQF0lwtwXp8z4NqfMXI99GjEpwomZSHu1jVT5vx6o3yl52Ow4SH8vd?=
 =?us-ascii?Q?YAlXbr8hMsx9gr/lVTSccQLXbaa4OqTTXPJYCg+LSE8+0DT3PtuwUvfYiP+B?=
 =?us-ascii?Q?ZnDKODax8B04Hj+yJJqHE2V7eS0cSj0j2gqocgwylKFTwmlPwBLdBQpAE8PK?=
 =?us-ascii?Q?Inf2x2KJTTx/eeOhDB6Uf3fT2lbc+OnbdTkf/LCU+07ZPps0kHHPE9gjqtqU?=
 =?us-ascii?Q?MY/86I2p/a47/OWStIvGE9OC1FgHTBMCZEG2v2LmoF85tKi9nnFFeEBSDXKD?=
 =?us-ascii?Q?g7xW+gkOtWEGqqIqIIEtNxI4CLP6h9XPQBRyLuL8IDxDeA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jvwXydYxtbPhf5OGnAWNcQgqUDfDew0AHeUqRUzJKxLqzZmZ8ag6Nb4YVcjH?=
 =?us-ascii?Q?1erHDKMJj4H098gXlECgnDOE6FdbLEbztxRSc1ydB7dIeo2v9lkGCNrobkyV?=
 =?us-ascii?Q?PLi6fhohv0nHdNhkJgi6CWC+VeykLr87Dp3NJjxYb2G0HmfT/rpUJ96xm583?=
 =?us-ascii?Q?YEdC48zjt5Cc85e3WanG7rikAYUGv9ooC+F2ZjNcy6bids/NX1C0eiWRhm59?=
 =?us-ascii?Q?kxIWQZQhdZsMSuuFw2JI91sx2PoJ8RuKCnBX07dS5ZAVes9Y4BM7IXaOMZBT?=
 =?us-ascii?Q?w4P4Mc14maQ0bUhlwYZ/rpgbZqTVI/sDOR4zLBbO68Og39IfHaT1s5+LCWQP?=
 =?us-ascii?Q?pWf7lkQxgI522O3K7c+M8pQfYdJ0ATiUcgbWagqhr4zFXRFb04dMNsbdwdFq?=
 =?us-ascii?Q?+Jk18Tk1IzvBnCw+rVimJXDqXyHylbvr7g8tx+/jwDk+qQL13mn3zdqL4u7G?=
 =?us-ascii?Q?J5qFgQSof+BdMhlbtFH7D9AqhNueQtuaYsCGyXPe80rk0P2TMXrgCfVDgUsN?=
 =?us-ascii?Q?qwUMjlj8z0K0ddcsUMRgX7JAoOMDKVkWI5qYKnHvC7RzVzsSjsdhuUrkWG/u?=
 =?us-ascii?Q?QWebfaEJSdpnjyryS+psHBCxSjtCZiboyFEpExO3IH3E6Tfe3RqHjKqWrigD?=
 =?us-ascii?Q?iiUXKMntR7hc9VomCq7+VlNruaG4lH6a8fpN+S/phKuIEx41RbSCi22XO7GX?=
 =?us-ascii?Q?wz586PqsoNBMwOAeWQKB8up9SiTq20qWqZjynbB6moO834185agWvNf50caU?=
 =?us-ascii?Q?/wBlwKmAd70uY7wT4sPQYS3SOtfTnmA2SwOCKSDk0R8lMNVIlRM/sUZnCLk2?=
 =?us-ascii?Q?Hww2lOyLgc78CX3ovZArJKsv5ayqqTdznNbovRsHALYXlEKmYru78Ol0WmE9?=
 =?us-ascii?Q?edTSIvb2N8NRup7um7xWSGdaBeYypIuvlUeP6hWuXDR9gjo///YD4EOlJUZb?=
 =?us-ascii?Q?6t9/aMgD0CP7GPIQpZY+Jw25oX2KM5JHjSP1IkeGVDnv4RVON01BN0zUpLWi?=
 =?us-ascii?Q?OXwsj8jYsSpNo/07TTo2TA91mvvuiFGG1HBjKJ8aTgnYluUqCquIvIdPK9h2?=
 =?us-ascii?Q?jV9e3JYUmtF+v8Qkv0RJUvM1X0aiNjqfxVFQQoLgb2/DZ/PNzXQ7R5mCfljT?=
 =?us-ascii?Q?aHwHpWaWRTTmsTd381DTPuArF8bdvlvD+fFQxKM6ExDPrvrP2e5BmQDtB1ju?=
 =?us-ascii?Q?oNcO03FOQ3EXBn+AzhTXHJMyqpTOgT7th8UThag2ODv1oPZr1Dq0HX/CEOtg?=
 =?us-ascii?Q?L2B2jSo+QNmnCVC7fbFrM3n8q0VMPb5J2Om7/K7DWD3YTH8YFoncLyreC0DB?=
 =?us-ascii?Q?X0Y2BBZA66mx6T2O4ZrcVJzdh6YhmxQDVg0vYJDRgTzSSqM6PeXnT5R9QYFx?=
 =?us-ascii?Q?VHOl6p+o1vTxvQ2cEX1rY1EVGknbqxTW/bFq+Sv9yv2uLxDwJYF2u4A/0TL9?=
 =?us-ascii?Q?PFa32qCYpFTl1ngepstdnU5HVsysp359PaBPUsmVabdnIw5CL1EmtmJ4JT5A?=
 =?us-ascii?Q?H1kTvfdObhHRkPyRMR9mqYkpKWAH1fgkrU48ykisZir3BV10zICKGck4JTkg?=
 =?us-ascii?Q?Nf0G1Zsjt+aMaMCGVO/sbGAERftOu09F32xirfyI9sVDBmml8SpYCGB9SYgP?=
 =?us-ascii?Q?rQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	AXwF/yOYGq3ctO3dzUO7igNm1VxyFrfsIZZlzx68GmViwb+5EmZ9jOpCRcjmJbkWZKeYbo1m8hlj+o1halPo8cLtL4a3HnOROZRrTAV4cSlXkysW1A7mViEuVbOZYhoKWAYCzgFJiTYPNlnVzhIKIdNWCzSxQKy4oi5lB7B0zSJw/olyE2+c5naj1YjSbuplALvL6m3Nc62hpoZKHIUwJhooPSQVdwjQgpAv4qyOIqMCgg5mYBOH80bgC7aow6SPnLzqj9ls+/o7od/NEMwWg92Dd3HwQ1JqDFofc/8BXIyleoecEELyrnvnJ7Rsv4Q3ABZNd6M9XIuaIBx6e80sx0bW/Y6NfZ2hV2LB+KucujTQFOR0mrkiy5fb6qCkvqN/LkS3G8IfS2xHo5DBG313UQJpd09gIUMEBayICYvKc5I5SNei4aXduh99ldSay8fNqqkVWtTF9cxVsoUBAjdY/lFgrV0zFub7tWU/9xc2lRrdiAg6BFjvdVRKmTiGFek3hGFRLOkVh/u/VoEmvO1Fr1Tjm08ujBTST8VGaFFAVe/mtJz3LhTRcDEFa3v50PBfJiCIQZioDfqMTR8nSQqe5DN17blylQHmxu/xlGQpgbc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 775cfff4-bf7f-45d6-6c58-08dc9ac92a66
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 18:59:57.1926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rTKpzqv1y7f4Xe3WdmSaV/gBsvLCvFAp4idJbeAAskCM47lz+pNNjSGddHGeavJV9mR7ikl7BZ2EDBeGGAbZGFCTfPfRfzB3TdSfwV3TlpU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6601
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_14,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407020138
X-Proofpoint-ORIG-GUID: L-ogHtybz41xqpRF4ZoiM9t-aZOa9Hsn
X-Proofpoint-GUID: L-ogHtybz41xqpRF4ZoiM9t-aZOa9Hsn

On Tue, Jul 02, 2024 at 01:30:11PM +0100, Alan Maguire wrote:
> On 01/07/2024 18:47, Kris Van Hees wrote:
> > On Mon, Jul 01, 2024 at 06:21:19PM +0100, Alan Maguire wrote:
> >> On 01/07/2024 17:50, Kris Van Hees wrote:
> >>> On Mon, Jul 01, 2024 at 09:06:32AM +0100, Alan Maguire wrote:
> >>>> On 28/06/2024 22:55, Kris Van Hees wrote:
> >>>>> Looking at this again, I am wondering why we don't just add type info to the
> >>>>> data record?  Since we know the type of the data items being added to trace
> >>>>> records (and type is expressed as ctfp and type id), we might as well store
> >>>>> that in the record.  And that would make this entire situation pretty much a
> >>>>> non-issue because the record would already comtain all that we need to know
> >>>>> to consume it and print it.  No need to pass a module id.
> >>>>>  in 
> >>>>> If the issue is that modules could get unloaded and thereby some pointers
> >>>>> might become invalid, then perhaps the solution would be to always copy the
> >>>>
> >>>> Yeah, I think (as well as modules going away) the other worry is record
> >>>> corruption, so dealing in direct pointers is too risky I think.
> >>>>
> >>>>> type to the D dict (I think that is the right one - I always mix C and D).
> >>>>> And since that one is always around, there would be no need to associate an
> >>>>> id with the module and pass that.
> >>>>>
> >>>>> Perhaps doing such a copy is the best action here?  And we may need to look
> >>>>> at other cases where typed data from modules might be stored, and if there are
> >>>>> any others, they may also be subject to possible issues when modules are
> >>>>> unloaded and in that case would require a similar type copying action?
> >>>>>
> >>>>
> >>>> I looked to see if there any CTF APIs to simplify recursive type
> >>>> copying, and  I couldn't find any and that's my worry - this sort of
> >>>> copying could get complicated fast. The other issue is size - a lot of
> >>>> the kernel types will pull in a massive number of dependenent types
> >>>> (print()ing a skb will pull in sockets, task_structs etc). Duplicating
> >>>> all of that in the D dict would be expensive I suspect. The other danger
> >>>> is introducing multiple types of the same name into the D dict might
> >>>> complicate things for other consumers of it.
> >>>
> >>> I mistakenly thought that we already included code in DTrace that performs
> >>> type copying, but I cannot find it so perhaps I was mistaken (or it is more
> >>> obscure).
> >>>
> >>> But then something else occured to me...
> >>>
> >>> This is all compile-type-known data.  In other words, none of this is passed
> >>> in the actual trace buffer.  That means that we have a lot less worries about
> >>> how to store this information.  So, look below at your patch and some comments
> >>> that I think make it even easier.
> >>>
> >>
> >> Thanks; more below..
> >>
> >>>> The worst case scenario in the current patch series - that the module
> >>>> goes away - means we can't print the type info, but that's not the end
> >>>> of the world really. Certainly in the kernel case most modules tend to
> >>>> stay loaded.
> >>>>
> >>>>> On Fri, Apr 26, 2024 at 02:33:26PM +0100, Alan Maguire wrote:
> >>>>>> when generating code for print() action we need to identify source
> >>>>>> of CTF; is it shared CTF, cdefs or ddefs or another module?
> >>>>>> Introduce a module id scheme where the module id can be stored
> >>>>>> at cg time for later retrieval at print time; this allows us
> >>>>>> to later look up the module and its associated CTF without relying
> >>>>>> on possibly freed pointers.
> >>>>>>
> >>>>>> Under the hood, the id scheme uses a monotonic counter coupled
> >>>>>> with the hash of the modules name; the latter allows us to quickly
> >>>>>> look up the right bucket via dt_htab_find_hval().
> >>>>>>
> >>>>>> This fixes an issue encountered when using a shared kernel type
> >>>>>> with alloca()ed memory; DTrace assumed the type was in ddefs
> >>>>>> and it wasn't so it wasn't displayed.  This change fixes that and
> >>>>>> all tests continue to pass.  Also tested that it works with
> >>>>>> kernel module-defined types now:
> >>>>>>
> >>>>>> dtrace: description 'fbt::ieee80211_rx_napi:entry ' matched 1 probe
> >>>>>> CPU     ID                    FUNCTION:NAME
> >>>>>>   7 123161          ieee80211_rx_napi:entry 0xffff9f8980fa08e0 = *
> >>>>>>                                             (struct ieee80211_hw) {
> >>>>>>                                              .conf = (struct ieee80211_conf) {
> >>>>>>                                               .listen_interval = (u16)10,
> >>>>>>                                               .long_frame_max_tx_count = (u8)4,
> >>>>>>                                               .short_frame_max_tx_count = (u8)7,
> >>>>>>                                              },
> >>>>>>
> >>>>>> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> >>>>>> ---
> >>>>>>  libdtrace/dt_cg.c      |  7 ++++++-
> >>>>>>  libdtrace/dt_consume.c |  7 +++++--
> >>>>>>  libdtrace/dt_htab.c    | 17 +++++++++++++++++
> >>>>>>  libdtrace/dt_htab.h    |  2 ++
> >>>>>>  libdtrace/dt_impl.h    |  1 +
> >>>>>>  libdtrace/dt_module.c  | 30 ++++++++++++++++++++++++++++++
> >>>>>>  libdtrace/dt_module.h  |  1 +
> >>>>>>  libdtrace/dt_printf.c  | 12 +++++++++---
> >>>>>>  libdtrace/dt_printf.h  |  2 +-
> >>>>>>  9 files changed, 72 insertions(+), 7 deletions(-)
> >>>>>>
> >>>>>> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> >>>>>> index 27246a40..30cccdaf 100644
> >>>>>> --- a/libdtrace/dt_cg.c
> >>>>>> +++ b/libdtrace/dt_cg.c
> >>>>>> @@ -20,6 +20,7 @@
> >>>>>>  #include <dt_dctx.h>
> >>>>>>  #include <dt_cg.h>
> >>>>>>  #include <dt_grammar.h>
> >>>>>> +#include <dt_module.h>
> >>>>>>  #include <dt_parser.h>
> >>>>>>  #include <dt_printf.h>
> >>>>>>  #include <dt_provider.h>
> >>>>>> @@ -2832,7 +2833,9 @@ dt_cg_act_print(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
> >>>>>>  	ctf_id_t	type = addr->dn_type;
> >>>>>>  	char		n[DT_TYPE_NAMELEN];
> >>>>>>  	size_t		size;
> >>>>>> +	dt_module_t	*dmp;
> >>>>>>  
> >>>>>> +	dmp = dt_module_lookup_by_ctf(dtp, fp);
> >>>>>>  	type = ctf_type_reference(fp, type);
> >>>>>>  	if (type == CTF_ERR)
> >>>>>>  		longjmp(yypcb->pcb_jmpbuf, EDT_CTF);
> >>>>>> @@ -2842,9 +2845,11 @@ dt_cg_act_print(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
> >>>>>>  			"print( ) argument #1 reference has type '%s' with size 0; cannot print( ) it.\n",
> >>>>>>  			ctf_type_name(fp, type, n, sizeof(n)));
> >>>>>>  
> >>>>>> -	/* reserve space for addr/type, data/size */
> >>>>>> +	/* reserve space for addr/type, module identification, data/size */
> >>>>>>  	addr_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
> >>>>>>  			      sizeof(uint64_t), 8, NULL, type);
> >>>>>> +	dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
> >>>>>> +		   sizeof(uint64_t), 8, NULL, (uint64_t)dmp->dm_id);
> >>>>>>  	data_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
> >>>>>>  			      size, 8, NULL, size);
> >>>
> >>> Here you add a data item in the trace buffer that will actually not store
> >>> anything at all.  That got me thinking...  And then you store the data size
> >>> both as the specified size of the data item *and* as extra argument.  That use
> >>> of the extra argument is unnecessary since the size is already being added
> >>> to the record as dtrd_size (which gets its value from the 4th arg to
> >>> dt_rec_add().  That means we can use the dtrd_arg for something else.
> >>>
> >>> So...  how about you do the following:
> >>>
> >>> 	/* reserve space for addr and data (modname and type as extra arg) */
> >>> 	addr_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
> >>> 			      sizeof(uint64_t), 8, NULL, (uint64_t)dmp->dm_name);
> >>
> >> Maybe I'm misunderstanding here but isn't there a concern if dmp goes
> >> away before we collect trace data this string will no longer be valid? I
> >> _think_ if we were to store the module name we'd need to store the
> >> string itself in the trace record. The module id approach was an attempt
> >> to remove the need to store and retrieve full strings while not exposing
> >> us to the potential risk of invalid pointer dereference. Sounds like the
> >> trace record storage implementation was inefficient but that was the
> >> intent at least.
> > 
> > Easy... replace
> > 	(uint64_t)dmp->dm_name
> > above with
> > 	(uint64_t)strdup(dmp->dm_name)
> > 
> 
> Right but then I've got to
> 
> - allocate a string per print() action
> - free them later (presumably on DTrace cleanup?)

These do not really pose an issue.  Unless there are going to be a very large
amount of print actions, but then again, we have similar situations elsewhere.

> - when consuming the record, I've got to compute the hash on the name
> string to do the module lookup by name, rather than by id where it is
> pre-computed at cg time. This adds overhead to each consume action.

I did a comparitive test between your v3 patch and a modified one that stores
a copy of the module name as dtrd_arg to the data record.  I honestly did not
notice a difference between the two approaches in terms of performance.  While
the use of a string causes a hash value to be calculated, using an id also
incurs additional cost in its processing.  From the looks of it, it is a bit
of a trade-off where we incur a higher cost.

My preference would be for using the name primarily because it does seem to
provide the same level of performance, but without adding additional support
in htab to make dm_id work, and also without adding the dm_id management code.

> If you insist I'll do it as this needs to get fixed, but I do think the
> module id approach is cleaner.
> 
> Alan
