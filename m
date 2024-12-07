Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D372E822
	for <dtrace@lists.linux.dev>; Sat,  7 Dec 2024 04:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733546339; cv=fail; b=utXJVKtvRDkWx40KTQHlrd2yo0ea0qO6f7D1R/4sozFzqSRrPH4Oky841DSA+zIGd1KFFovsjE/W5Uss7Y3+zTCKNDOAINA2eNd5fWMnXeUF7biCcHT2s1q/8CG3ZwNJzmCaQCBU03D79Mf8abKLLwOYhdJt9fVgjdMGw4akuFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733546339; c=relaxed/simple;
	bh=OZ2ya+3yGnER7Q4nBOXQCpVmGqXqEa947p8BmoBPT0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Eg9qGxoXuCXPMS5p+xq7cdqqR2zf6rdPkfItw7wesbehWbnq3boHK5Z3XM6y/p0RqAwIh/Wyh8FbTP9TCwubSHFvW9UTfParEJHP+2VZ6HS3Wxr8NGNawpiA+J1hlUxlc7XzhvpL4e2VIbx3KxrLw8qszKf7IXUHqQsNFw3Ngkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IZyIlzEz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JK/n0ZEP; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IZyIlzEz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JK/n0ZEP"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B74GqJw026948
	for <dtrace@lists.linux.dev>; Sat, 7 Dec 2024 04:38:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=G+UNW5vspLr2Hfra78
	XvQJsXbB/StmyMBiwzo9Vm30k=; b=IZyIlzEzebE+2/OBKm6HA1JARmbu3vrft/
	bh2iU1N90pTXDO/vPhoi8tylJMNhjvgEky1hNJh367cRPsqWqQc006376Cwhe4ez
	3kj6bSfS/XHnkVeYXl2aKjpxDPmW7YrcIaQTPRnd95Z0pZXLWhhIhIdHHBJQKJkr
	yNpE6Sc5dFlLRkwK3xJ0iqTGoj2wCg8OcGdeBPXhGSXAv8wdA3ZUwPvAdv102DZW
	gkqQGxMtIrH4UVcxTNtdHhZcCXgfGmzwu3Cq+TTDrmQI8UCVYSdinFeSLiy9N64E
	RzDLijSRYiHfug6kL+lP/MZyhfx5+nqw1a86026RjnnOJnUlaMTw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43ccsc84m0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Dec 2024 04:38:55 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B71Xdag035603
	for <dtrace@lists.linux.dev>; Sat, 7 Dec 2024 04:38:55 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2042.outbound.protection.outlook.com [104.47.58.42])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43cct5jkyc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Dec 2024 04:38:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BRJ10/AjxuIIiUyxnMw81T9xiKQuooctj38uboWKi2jx+69xi0Hk20GJvuUAb4FKQiq9UUjOsVkATfQRVUY6NGnR4MEOpmZbdWzbVA1gnmxojUK1grrE8X/0R60EGG1+kIB8FiymK4lEBuTJMzQ/ZQfagLng2wJpeXK9HdrOQ5Y9MkzGKibMvtbMbhWglxTrJtb3fp+BR4uPKstaUa04JsKyXTricUugL1RiyYp4Q5J3R9/7WtfmxC7a6XzE6L7US2TOflDImoeW7U0usWMWZZ8wVIpAUgukgZbQlOr8Cv/NiPhWx02Yd0UFy3RWAkDtj49HrfB3q5fTAugCln1mdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+UNW5vspLr2Hfra78XvQJsXbB/StmyMBiwzo9Vm30k=;
 b=umkWTSWAGFYYQuQEPor8vLltre29wbl8GLnblfsvG53cqh56YwQw15gpJaMMN+ZMT/dfgZFqsFR6yVK/J3943ecT712ULVgoKF61pOUaFNARtL5t6yP3HaHVpYK80y4p7DonLKEMfyYqELV0GrDNgEs5QjgO+6iULFHSq9CDbTfiAAsd64DUUSW/JySNCQPsbNQJVEF8igFxxCC3SsbULOM1Hi6O/YVNmZp1K5yHjnhSFKeZkXI63/zCGC4ZeyCMgJlHKx3WJ3lbW5POLIImkTdSMMJ42PhyvXK/lTIp6UPjLdaFfvd61vfME0FvKeMswpgC08XLuiQEO2Rk7qOn6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+UNW5vspLr2Hfra78XvQJsXbB/StmyMBiwzo9Vm30k=;
 b=JK/n0ZEPN/vEpU2MrTYfxQrkIga1v3oZd194vsEYHdODKSwiUf0gp5Aq9lt6diBrLMiTP6ALXmUuO6bUYIflbCxQSZ37Gq4aZUDBkPjy2SaB0nNAFUqiEP4d29Nbc8fnD6h15lJYNmWeuf090Y3CE+19KbM8oZbVqGet5A57HN0=
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19)
 by DM3PR10MB7971.namprd10.prod.outlook.com (2603:10b6:0:b::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.12; Sat, 7 Dec 2024 04:38:52 +0000
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe]) by SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe%5]) with mapi id 15.20.8230.010; Sat, 7 Dec 2024
 04:38:52 +0000
Date: Fri, 6 Dec 2024 23:38:49 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com, eugene.loh@oracle.com
Subject: Re: [PATCH 4/5] libproc: guard against Puntrace() of terminated
 processes
Message-ID: <Z1PRWViU7tHOQ0xE@oracle.com>
References: <87ed2ozlnd.fsf@esperi.org.uk>
 <20241203180946.371404-1-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203180946.371404-1-nick.alcock@oracle.com>
X-ClientProxiedBy: BL1PR13CA0429.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::14) To SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB6350:EE_|DM3PR10MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: 5db6141e-db76-4354-1e0c-08dd16790ce1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r1SPCVZzj8DFf2kJgBRD6Go7rW1PGmEnF8PVgdZ8wuO8aQ2czPCS9eo/nvCM?=
 =?us-ascii?Q?/qZ/T/D8tkBnChdwXh316l+Rt6IbfkP3Z69k9ziFKgaRrXcdypiYXJjfBZg8?=
 =?us-ascii?Q?G+RSzdfXyM2Us8IGLPLhzhyvn7VsjAWGi+Uag6Axx7sVo6RGmhBh1Km6aKH7?=
 =?us-ascii?Q?jkk/kPmYdD9Q+TKZPRTEzaVFqZfI5xjWkVtsghzp97gVNm4pAgkG41kwEZZB?=
 =?us-ascii?Q?AITx9PtVrd5p/LFWXU+EfA52tFCY9EPVpdMeOsGn5huVsEAn5gJ9OAW+nkmN?=
 =?us-ascii?Q?D2IIuTAWnk5e4G49lTwkbyls+Fo7Y5j9U6GusYzfi8uKjhOCTsjwsEQNSSZh?=
 =?us-ascii?Q?s0I+E+gKhAozc1qt1Y/HDAqVzU8rCtjDsmVZpjYX/8PQJ6uvLpKTLxE58yA8?=
 =?us-ascii?Q?DBaUFxQm9hRloQ943XiP8bbu/nmcNQWK6ZITZ7S6qgyydnCtjXYN4W8ALGIw?=
 =?us-ascii?Q?O2ive50eraZNoQO2M3f6YDU735+HKpS+Lo1sglfNBT+3OuShQXIhbghPdnVH?=
 =?us-ascii?Q?2IkaXpm6dYHGzoo980HRmLSM0NRxksjoS0KoBlrtFrJdwPTva1a+6ti2XcaY?=
 =?us-ascii?Q?3D9sS8JThajiYvytmxLQg1qBpsNuf0uaQ9+bFHZzrfGAml1AJTnq1iTEEeVx?=
 =?us-ascii?Q?8ccHYorhobm0XtWurFolw6F4iLeeJZsXzxiNKjBsgDg+ONhTfYw2D+N8Mc5z?=
 =?us-ascii?Q?gD3dmwUFy3sY7goYVycm+tJtk3M4Y6mmqxyO5C11ROedoiChlRH48Qqfoomr?=
 =?us-ascii?Q?CCfdI6nw6oAMEFmQ1WHoVAktT67QfIgAUpITiScykRxOOvt56lKP9qmbta0z?=
 =?us-ascii?Q?HOOlxLSZyq24WA3H3GN4J7kce9J304HTpsIMp4oQ6wkD92n3KNCAAwYts4nh?=
 =?us-ascii?Q?bIzzakarH3AZQ6dqSS+KkUnv9ayRaTDkB/9SIKY/zFnkn8S4Adi8gWc5SNCC?=
 =?us-ascii?Q?jIh4nOhYdrMLtOI85LC3cDUS06I2zBQiEMCxNjayHCwdU40m+nuR516Lkb4N?=
 =?us-ascii?Q?hCVt6GMUqWNY0C8KyD5xmai9yf1Rrz1jfAyDIY+SEb+rlei0s2TtubzXKmRO?=
 =?us-ascii?Q?bL0JLarrD0VzmNYbIAVbJjC6w/x2aYggaiWOXeL1A0rbI/NTsDXZ6p6wJ6WY?=
 =?us-ascii?Q?6jP/LyiX2iMUmoxBuvxMMVDKekTTOJOOZCZ/mKoswVzM1Qj13GG6gNpYNEE9?=
 =?us-ascii?Q?R8sxrYDedUGDvNJaisxKU9+9qL11/vD2X6CQAOwzkssdmjubGrQDzVFS4CMM?=
 =?us-ascii?Q?5D5IgwJRR3XQyiZJT3Tmg9r9OsBKytZnZUBQI5LQJKptUWrS/sXv1pFCXyuu?=
 =?us-ascii?Q?Fb/jw3bC6La+Q/0YLs6rXhpJkzSOUA8UAqnT5vdO3IZWenRWYpf6rn5wmVZt?=
 =?us-ascii?Q?ybw+XUI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB6350.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sR3qVkKyxb08apgrCfujLQpGWEQr3a5Fe1m0JgAAwbdVVrwXqlnTsNgmGlNk?=
 =?us-ascii?Q?cnQV28+V/ilse4noOoDqXSe1Wz9kMJ11pplyyxLjHxZ7P417DlaSObdTB/c0?=
 =?us-ascii?Q?7UQ+m5Lmvp+IecvcMnqjuQXVlr/OzL/Hib43dKBzQsSlNPUjs/sQPhAbnAeK?=
 =?us-ascii?Q?Ua0yw5TEJRBuKiSCwFC39EcIvEEJSlFlkOQQVg0wSEWvdF7290EbPgH1u0XT?=
 =?us-ascii?Q?Izo1Lzw1yOSYyWaUd6cUrkhELlUXWCgDQg+8CFdZmsFrbVZXup6EJz2FAtEp?=
 =?us-ascii?Q?w7aHXvDCUp0hRnjYSPVM0W25gFGgCDij/k6LNetSk65yYmqQxQcH2kIe20SY?=
 =?us-ascii?Q?+GWeZ3bIYaTZBMt8oDH7SeCvdXTqf9UVnT3Oalk+/0kdXi/5nyTcEWUf8toQ?=
 =?us-ascii?Q?I364opuAA1G8KVS7o17KoNJy4dNE08Wv+RCqgxpm0gEXs4mogu9pQVkaJns/?=
 =?us-ascii?Q?8skQ5bJXh8NHNnJ86UERBTd2XDqdYDpeL/sMWE6VtaLr3n2c2IVJNMPJBkWe?=
 =?us-ascii?Q?DrQenWii37qtzxRH/6obYnSImyYBb3jx3RKw3GFRipCM3Tv+x1ES8A0HVQIg?=
 =?us-ascii?Q?lLCVcBdquI8M/KlRvqibmJ8cITHgCrlL5mUhwTVd4Sm1RK4lRQgLv4u/H9qA?=
 =?us-ascii?Q?VkXqD6WbyTA4Jgt4YqSUaFAgXCBqFXFyiEp8zSNTdKss3e6J7XXBmLxniEws?=
 =?us-ascii?Q?cO+yhb1BJNotU7+clqcyTBILe+LqwZo/3fsEiX0O1khtH5vC/gY/zm4kISMM?=
 =?us-ascii?Q?ebyAN9OQZeXZE6AGuLPSc709miiJHyfjVMKDl3udlmD0EzdM8uiwTnVgoaJq?=
 =?us-ascii?Q?iP5DbuiekJMmGprVBQYUzPmDWPN6bnNzsL3xXruIgfw5+yBy7LQR2snPHMEU?=
 =?us-ascii?Q?vbdGsBO2hBnERxe5gvHnLwUuwXQuKGS597+tTRrQuSzCTAO77j+QiDau2Nn0?=
 =?us-ascii?Q?29Sf8YcCc13Fa/N7OsiBO8Z/s8E/98jN450jDNAPkYF7LaPO5dtMnQGqKQJy?=
 =?us-ascii?Q?clRSko299sViwmsEMrrIar70lQABcdWYlcAUdwkgYj4aXztSohorenkP1GTc?=
 =?us-ascii?Q?7W68kizB6TIZ1vn8lNDDCHqtnLZoL2cvx9ZF/FWrjUwrw77rladm1CNLPZug?=
 =?us-ascii?Q?8AGkTx/lM9HwHt9Y5L6jXPsmtgdwXavG1XcNdbdiQV6EUw0x0sFkO2WR7MCd?=
 =?us-ascii?Q?hLbgDFG8DyWj4xkUMP5tSu0qJVcrQskpwE9J1ecLGgBOWsx+ntECwxPV+Gg/?=
 =?us-ascii?Q?xYoam+IZPmQyXlB6V+7RkJLvKVYQgZcP/p7Z9id/bB8BForKGgW4J0KtBzvM?=
 =?us-ascii?Q?uJvKvmHBzA/1FjEbhcHdzXRRbZAP8SDISd32KQtee4OFZ8WZ7Mz8KGW5ME37?=
 =?us-ascii?Q?jlTTVFQgtuRAPPy0b+7QneiqRqYu9euA8kZ/sXegGnh0UybM9htoMbhhPFhv?=
 =?us-ascii?Q?JfrtPN/oIoq5Be2XXxWrEKwCrM9PoJTvR2Nrngd1rvfb2nJtf8y1vtOrd7+g?=
 =?us-ascii?Q?WyuaK73VXYe3Y2x7ftlcWzkyM3sVCIhfglS7W/5rvJfEBg4MLuXtr+veF3/R?=
 =?us-ascii?Q?EsxRlKmxJu+ImOFLkUpNbA0TuR3hU1f+f+r/pZMHHeJFMfMNjZ+5BIF9M5YQ?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cUa7bWxclxKw1coHjHof3TE6c6VqNtFkvUYwrYdUintrPESUUplphv9KDmrlibxihUae1KfwZV5p/mYQJDMrWXwE39ktuWNw8OKA2dh2z71wCPpg82InZ+ungfTn/u5FgiXlkPo4UIwkRYFVBYC4xH03R7qcDZyRNjr4UGXcd1L/DIFeHbLu5Mev71VMSarb2A2xq2T77bS2gn15QqwcgOzsPtcduAcOfgGDyeI0/OkqS1fqpO06rUdZFX9c2+6NFf+mBXXjwXNNqPJVP9XvfBc8DQ/25iLe2kLRk7BnMrbAtYXat8SNKcrYb7WN7qUdwA4vgvXxjNIiH5UbOG92doagZD3CVqG05fxUlEJHy4k8s/Iy7/dQA27Wfqx86LWNX1iAyHzmL+K6Bw/xDoUCJr3QEWzAqmw8oG8ZagcbO0v2hdR5ig1S79XmhA7nbdeza+MdUDhEbsvatOQWkoaYX+xXd3iOLyiQ/pXannkQaTcJCj2Z2mDVGa6H5M5EC1FTN0C+/8iE6sggwaL3oIUTqZo3GNnm33/hiKwTYXlSZCX5j6kLNgbnPbmsjFsLinXmByApdcerfxQAIJzGyJ5pv9NLeUoE3PWJRPvk0HQt4kA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db6141e-db76-4354-1e0c-08dd16790ce1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB6350.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2024 04:38:52.1060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vbz3men9ALSrE4G9bTQjrse5qpFqbrJxxVJQ6x1t5ZMj14U5ihJYbvNjz2FdgRaYPWwrJg2TLsSlqLrvuRH+uGenPgw71clDqq45051amgE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7971
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-06_18,2024-12-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412070035
X-Proofpoint-ORIG-GUID: JtwD9nAYnt3r9X4Y00xxL57U84VblmCU
X-Proofpoint-GUID: JtwD9nAYnt3r9X4Y00xxL57U84VblmCU

On Tue, Dec 03, 2024 at 06:09:46PM +0000, Nick Alcock wrote:
> If processes terminate while the main dtrace thread is doing something in
> libproc, the process-control thread will clean up, releasing all resources,
> including cancelling all ptraces.  Unfortunately if the main thread is in
> the middle of a Ptrace()-related operation at the time, it will finish off
> by doing a balancing Puntrace().  This is of course now unbalanced, because
> the process cleanup did all the Puntrace()s for us; it will then try to pop
> a state vector that has already been freed, yielding a crash that looks like
> this:
> 
>  #0  0x00007f55dbe8035f in dt_list_delete (dlp=0x7f55d0001428, existing=0x0) at libcommon/dt_list.c:81
>  #1  0x00007f55dbe8239b in Ppop_state (P=0x7f55d0001410) at libproc/Pcontrol.c:1280
>  #2  0x00007f55dbe827fb in Puntrace (P=0x7f55d0001410, leave_stopped=0) at libproc/Pcontrol.c:1456
>  #3  0x00007f55dbe8bffd in rd_ldso_consistent_end (rd=0x7f55d00046e0) at libproc/rtld_db.c:1113
>  #4  0x00007f55dbe8d5d8 in rd_loadobj_iter (rd=0x7f55d00046e0, fun=0x7f55dbe863cb <map_iter>, state=0x7f55d0001410)
>      at libproc/rtld_db.c:1934
>  #5  0x00007f55dbe876d3 in Pupdate_lmids (P=0x7f55d0001410) at libproc/Psymtab.c:813
>  #6  0x00007f55dbe87827 in Paddr_to_map (P=0x7f55d0001410, addr=4199075) at libproc/Psymtab.c:883
>  #7  0x00007f55dbe5354c in dt_pid_create_usdt_probes_proc (dtp=0x1a47ebb0, dpr=0x29234ea0, pdp=0x7fff392bb090, pcb=0x7fff392bb170)
>      at libdtrace/dt_pid.c:987
>  #8  0x00007f55dbe54056 in dt_pid_create_usdt_probes (pdp=0x2ac157c0, dtp=0x1a47ebb0, pcb=0x7fff392bb170)
>      at libdtrace/dt_pid.c:1265
>  #9  0x00007f55dbe71ce2 in discover (dtp=0x1a47ebb0) at libdtrace/dt_prov_uprobe.c:520
>  #10 0x00007f55dbe747a2 in dt_provider_discover (dtp=0x1a47ebb0) at libdtrace/dt_provider.c:183
>  #11 0x00007f55dbe7c1b1 in dtrace_work (dtp=0x1a47ebb0, fp=0x7f55dbcfc780 <_IO_2_1_stdout_>, pfunc=0x404211 <chew>,
>      rfunc=0x40419e <chewrec>, arg=0x0) at libdtrace/dt_work.c:377
>  #12 0x00000000004066d5 in main (argc=11, argv=0x7fff392bb7b8) at cmd/dtrace.c:1556
> 
> (This can also kick in when DTrace erroneously considers a process dead even
> though it isn't, which is actually what happened here: we fix that in a
> later commit.)
> 
> Fixed by simply checking to see if the process has been Prelease()d in
> Puntrace(), and returning early.  The process is released and all
> Puntrace()s have already been done: there is nothing left to do.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libproc/Pcontrol.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/libproc/Pcontrol.c b/libproc/Pcontrol.c
> index a32a362eaa1fb..6a454ef86bc3b 100644
> --- a/libproc/Pcontrol.c
> +++ b/libproc/Pcontrol.c
> @@ -1455,12 +1455,22 @@ Puntrace(struct ps_prochandle *P, int leave_stopped)
>  	int prev_state;
>  
>  	/*
> -	 * Protect against unbalanced Ptrace()/Puntrace().
> +	 * Protect against unbalanced Ptrace()/Puntrace() and already-
> +	 * terminated processes; operations interrupted by process termination
> +	 * might reasonably do a Puntrace() to balance out a previous Ptrace(),
> +	 * but everything is freed and we just want to drop out after balancing
> +	 * the ptrace() count.
>  	 */
>  	if ((!P->ptraced) || (P->ptrace_count == 0))
>  		return;
>  
>  	P->ptrace_count--;
> +
> +	if (P->released) {
> +		_dprintf("%i: Puntrace(): early return, process is released\n", P->pid);
> +		return;
> +	}
> +
>  	prev_state = Ppop_state(P);
>  
>  	/*
> -- 
> 2.47.1.279.g84c5f4e78e
> 
