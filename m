Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F6E49652
	for <dtrace@lists.linux.dev>; Tue, 22 Oct 2024 17:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729617179; cv=fail; b=ZGtyHxqgXq/qbE1XKUnkH+LXRFi6sbFD0I5TRAG21Ihb1YENFJ6UnIoJA1L9lBmapjlzEKRiUXxhWTACoAYRRRbBT9DQrCSpddM/cG0iwkPvSQMTzEWSfN7gIGS+CvVbOObu6a6AiuR17oKufihPMXmzwY+i4quSzI7DkUmJL2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729617179; c=relaxed/simple;
	bh=1494BbHdo+4FeWq4RkaQKc9NziiK73GT2IFVoUn4+Wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lMoRhwVqowiZMeu6cTaEevp5Kp3XTQk93xTXkazQQtmaIKr+7AWMV8VDuZcK4IvTJ7qgwcYhO0wBOQ4t8vwQX4jAZYocwjY+NrspAj0LtdwnggXIyTmHv8T6HulZn/TIpXQ+34zcRJtsSUr8UOr3dv2805TBWaN/OIfMOsNj5/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CRsgnQqZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JWPnJD67; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CRsgnQqZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JWPnJD67"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MHBkbq021960
	for <dtrace@lists.linux.dev>; Tue, 22 Oct 2024 17:12:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=tIYOpQTVGjih7P4aqj
	tnBIJ79acVOUCiJdn7Y+zHb/4=; b=CRsgnQqZdkIut7KQ7CMjaQE6UAUl72n3FF
	b45015AVNSooYeEjASqIXtONj/Mib9BLvRTeTCgPR78Ud9N2JRm+CBXDbDuEEaX2
	dUPHTVWrS4AW3JeI2V0bwx4JepeocyLTbfBWMgZ/sh0C7LsevIchEFREcoOuXTQB
	rlxs5XoUsZWi13RxKqQfH9xWcCFjgoypMwFIbBhRImLchVsooI3YDpo06xSH/Vww
	eVgzxmJ797xutqtMpQ+BKXdaVthA9EdH7XgHtE7Ndn69QN3i4y35zxuu+f5j2W2g
	oExNuRwqcROnGO/x+v+A/9oY/GenvZ6lFWnqreCLys+3IO+kyVJQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42cqv3dbh5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Oct 2024 17:12:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49MHA3Gh026336
	for <dtrace@lists.linux.dev>; Tue, 22 Oct 2024 17:12:48 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42c377yajy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Oct 2024 17:12:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZUfLRtNAxfS7NWPdH7DCBLlqIscu6T41cPIDJVJgAfjBVLLeHv+NnJtrqhtEIRsM9vsISWM5wk8S+LtEiBeiL1KMjDEteMUWtwVBJUj9FdnCI6oLvWKj1Un397XUDCkNKmNtDTmIAJjaIdZu6yIN9AOKrg1jW0hJ1s813GEZ4SqzxrRDx2V+uqsbd6reRmNKlHwl4dcTwHY5L8Ee5V/Z1k7tG8L7t6oJ9vsua7ue1leIKZbp75SjyBYpDJkysm4m9AoM91gXYGYc65wURKqJHXstazfrUPPslCoPw8aSWXfTqq0nIM01zUAkyVJv1xuX9tis+phqLaIVgiqvaPn6tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIYOpQTVGjih7P4aqjtnBIJ79acVOUCiJdn7Y+zHb/4=;
 b=mFkZqZbG+GVEcsuxLHYJhCa0Qaed2pTbcifWUeLZv8uKhYow7cuaMY2qPAF5Q0kHu54adaaCcckKo3wn0G3JtfKRidL9Drn7AVvl8QISQwluStWCsmtZuPBe3WhmYL0VwubNUVyJwkqmpK5mxXvaV80Dd1vCetF+0vrKmvt/z/XcCm+VZuSGEopjzD4cgYN1NvVeJNcqd6Ui9pFS7hm9I39PlGE0wAng9tZV6x/d/gXda6MrMsJfxYw3Sqeij46Fmpd1JFDOQFiG++8Wbznuz1YBg3GTckTliUNJ2CSiS+NOlU81CCmEtKgQONTvmK24fvSClL/bM5SM8BNLDUG6vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIYOpQTVGjih7P4aqjtnBIJ79acVOUCiJdn7Y+zHb/4=;
 b=JWPnJD67QYva72sByLDlKvcGowocbk8sQTtafMWUmpzfJbAuioSw2Gp4VOkGqqOU5GfQWnRC6+pQxmiyQRSY5SAGvqnL+VBJvWRzA6QrU8P4unGIwnKmDZvdSRTPn67MTaUJj2VRIZeyHnzpQZsosp/OtGDK3Gem+sIGMc6Qgic=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by SJ0PR10MB4544.namprd10.prod.outlook.com (2603:10b6:a03:2ad::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 17:12:41 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8069.024; Tue, 22 Oct 2024
 17:12:41 +0000
Date: Tue, 22 Oct 2024 13:12:38 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 3/6] dtprobed: stop skipping zero-tracepoint probes in
 dof_stash.c
Message-ID: <ZxfdBruw9o1XK9Ll@oracle.com>
References: <20241018195808.270688-1-nick.alcock@oracle.com>
 <20241018195808.270688-4-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018195808.270688-4-nick.alcock@oracle.com>
X-ClientProxiedBy: BN9PR03CA0202.namprd03.prod.outlook.com
 (2603:10b6:408:f9::27) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|SJ0PR10MB4544:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bb8f150-fb4d-4a9a-cc98-08dcf2bcbcab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Bb5o/hbacL4uYdntfdBHm6phnYqmI7qzwQUbmMz2BRm4EX+gt2qLCFJS5eVp?=
 =?us-ascii?Q?MwAmeHDEel0o1PScFRrOxb3R/K+HVj+td5DYJM0bGl9uVqJPhDmlQs0VGSp4?=
 =?us-ascii?Q?NFKIeEo6gOYKJd2U9BW9TnYBPw57YtXBiUra//cigqNuqJgBz1i0LU7PLLd+?=
 =?us-ascii?Q?v+T0FtOzQxFEw8/1zWUzGvBhFQEYAe6/5w5HhPpATepV6BmjrND3E3MgNPme?=
 =?us-ascii?Q?5DnEUjHjTbSoxClBcmumEuopDQ/suBN+e4L6GRy3KTnUioMF7x2DYlvZmU8D?=
 =?us-ascii?Q?dIeMHHKNN6dNNymwicVvgIwViFQUyAVjrO/uhAZfI4KNyHh5r1HSqaXAb5Kt?=
 =?us-ascii?Q?wmoffA4TkHX9sYgskKS6i8I+R8/8hIFC2BsvBQae3e85yWEq+YOsh42CI+PJ?=
 =?us-ascii?Q?dJDjyoY61ZayszC0gw2//iAtTYVVuePaZTz531utbxplNXzv9Dy7ifKzKUVp?=
 =?us-ascii?Q?GjUikExZXzSc+FBoWyN8QGmVflCrIor1J/Ym1czwYovfx+8DCIeXQexKGDzY?=
 =?us-ascii?Q?CsfLp6LXyjYpnXl/j04FbJarCT4pOac+lnTj9tfw5yxiOSddSgP3IVSfj6iZ?=
 =?us-ascii?Q?Qsqfytt+VQpbUkApZTq4q+1MikmD1KadhaGxPbqusDc1PlGQnrgPpVi/UXdW?=
 =?us-ascii?Q?0HIduRR3tN14C1SZbFkaTvsyYChXIv3NMsj4RO5BkOknKE54Q2uOs6zVAwfq?=
 =?us-ascii?Q?HSREaPGzt6zmDvbURK4r7ojZhEtizcm2A7WigU7nXFkYwUw2v173P3wp7jZK?=
 =?us-ascii?Q?UU9g37gM/mLW6lK/V5ZplcnYe5E+RTQNXMSBpauKILSJAJw9Y8gUwm3NSKLk?=
 =?us-ascii?Q?RQJVTvO6zfPrOkhg37UBmgf0bwwnmC9+VxKbyOYI3jEYeEmAMIDwoZU03BRH?=
 =?us-ascii?Q?ji7gaavLHzBsNkOjBl+vLBrtyWTHeOEXFLvNWcKuud3Hy7e9rImHypM6L8XN?=
 =?us-ascii?Q?lYVv3yxFUfnUNU3ZECSsscph6N5VFyaDL5IbwvA/p+5lqX9kXazt1YENsBvy?=
 =?us-ascii?Q?ShRAaJq8L0QPLV4MklE8zPkpcVSW05Y3KOjeKdDw2n/LXzjN3gXzdY8eD2W7?=
 =?us-ascii?Q?lB0A/ydNHVt6xEPYRiWlGaA2W5yOfSrdclkz4v9TDbs45E1TeJHAi0etPT+L?=
 =?us-ascii?Q?CDMQ3tzB7uhXdlSby2ddnXTStXLFyynfC6tzKTJ2XmtkyPpvcMeMBd4OwKa7?=
 =?us-ascii?Q?rezOcXrshtXWHRse4qvRkYpDXXYbxtwtoYGaey3F1aCPQLw2ZXk3227RbiCt?=
 =?us-ascii?Q?x1RLuoPv9kjkN2IxxUYRLa5IuymVUkCOu/I2mCk8H+HegKNZFTpwJiAi6NeN?=
 =?us-ascii?Q?6R1Z1JtATpL8iX+8MK5L6V17?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LmjlS6RUcLZ4N5TglrWtwPFVGWXVx/wQV2+VaQuKBB0Q2TBMdDOqoaULJc45?=
 =?us-ascii?Q?kyVlLZdPw4mhUi+dFdpdNtL8izk149EAQRcyVDhykE+lBINTLL4PHGhF23B2?=
 =?us-ascii?Q?XLTgO7+/z/9mM+t44Jf0J0n2LKaKqtfPIVT97Xi0nipUj/JgOEJvbkNAP4hX?=
 =?us-ascii?Q?hXGfXsvQBLKN/ugKLOQ+7+9l1adVUQhmMVO8zf3uNC2vpYoxzbvKbIE2iUT3?=
 =?us-ascii?Q?lkyHjkr5hIIX7BuiXo9t7GaiF5FyzgyqYygGLoqcJtP5N9uojOBXRexQgTaI?=
 =?us-ascii?Q?Y5nm+1uVjHOREX1B1dz3uYZLyxLs6J+45YoqsArrBNwYY3IXX7LPTlqrorU8?=
 =?us-ascii?Q?EWNypPl5mcMv9lprQ0Fqu/gytq8V+8u2gjp4pXiKfb6Fh2V0p6GS15W4eudr?=
 =?us-ascii?Q?eIw7OzehKgfN3Vfp6patYSuLcB+MKsz6PD0wbhhTVQ0cXv0/gXr1VnYZldsi?=
 =?us-ascii?Q?T6U7yXzrsvWRLwiJjLu0IjhHmnLVK4VQT5XxOypZpY7OG4ofLcVQczBGvw23?=
 =?us-ascii?Q?Ibu9RQOvMbsgRQl7yQRLyR8+7Jii9w/idM8m88HLO7zlSm5j1g7ta5cxKfB1?=
 =?us-ascii?Q?nQk6eRqWl7OdSahp/IeUeFW4jgJvVTujgBJ7Xc/CaVPsXfDh5i96KKPzECL9?=
 =?us-ascii?Q?A64CtIrlPu7FpteIquRcwezh0Q9WK0tgzN057eCuy929njL2QIvQ8Cz4QxzL?=
 =?us-ascii?Q?HZ1Fbia5IuSldr17QUf9dx6POl2nG6f2gT/43LfJ1K7W8qVVz9KVMk5MnyY1?=
 =?us-ascii?Q?uf+Ln39fXB9wr+oY13dyjpLLSJocbO2TtRcxx+mGqqM/Y8C6407Dlm6Oj7YX?=
 =?us-ascii?Q?rwGRS+f008Fjt9ZCPDOq7Nyc1CtGU5VYBt+NFuIkjMA/9nTv/Bb8CtLYzb1K?=
 =?us-ascii?Q?3dcklSRbLn24rE0Oc6ycaZasBBDRU+o5kcm7C2i9uA+/YePLfxCYafB/dEU4?=
 =?us-ascii?Q?D4IeFgGE4cSUjz9Kny4AV8OepZZYz/A5z2lCbgzSlbnICpqlRK/rI1JdcX/p?=
 =?us-ascii?Q?ZMN3Zm2p7IDXJiWkRyWsRZqXvNyl4fY30HEevKBXOKWySWBLNvvPS7OXPLHf?=
 =?us-ascii?Q?kAxVYjtuAPYyc68bArtMLJSOf1wSUGt5ymPf0pbqsXTi2d59fDSfz0PofMEf?=
 =?us-ascii?Q?Znx2IGac84WOWCXacQrutbwJPnJYANXrgK4fDnYKqBvpaxKBJpfTISPrnJsZ?=
 =?us-ascii?Q?1qUCnKeT4w2jQyZ+aoI09UzRyBf3hmebQ95/5EdGwLizF1kf8IWll8W+pcXZ?=
 =?us-ascii?Q?7IK/OPt5bz/stikXCxjJmk66Jx4AuKLfKaYFtGijPhzEIX1Ztcvpg12869TT?=
 =?us-ascii?Q?JmYN85aGHxIIXiCMFNg05Szh/zcYKczyo8vxbkFXQqaFSnSO82AdIKGFD5mv?=
 =?us-ascii?Q?T9TJitssZwUkp/s3ug1+nNakfg3ojfJI2AZviqFfU77xUutBgY0DW0qiffWt?=
 =?us-ascii?Q?o3JvmjZtFyGxLzMf7qqkN7uN6t5iTGLzG1NJ6G7BU+/fNe3OEsRnIX5XpGR/?=
 =?us-ascii?Q?7NW6Z4gkQjB5oBGVQ7hPp5QoLXLlqkHfCbyMQGSWtdEfr+P2zJO0Qtu5Hfzm?=
 =?us-ascii?Q?TC2GRP5lwHTDKvMV/FjgQu6OuIs5T5t+cA10fi8XS7mGwayAZJJZnF7VaoqT?=
 =?us-ascii?Q?NQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rDrb2yxBvE48Ekj3kJO2OYpP/Hm3YUxYIdx4e5q8F7FAF1tw6/iilYoUBlvfC+amV2wK7xqFXPlFaX+vkgYx/PqpRof+ZOqV4tLqwcMCg/jSCWjTJRtmPjoeCrcSJudhxbVLAHQ+1NXYKUMb/J47p5okw+BTHhYgCLuQoWpxvFQDqLeVXppHnQGk3UINtwYgeYv9F3BZTJhY7CUMeOMt/5a0dmRzR5O8YvwfKCDOftejPayWOMBKXV5yCxMV/53rQsdZ5ItII4Z6ngtunvdwXqfp0663v6ZjhZ8IHHRRDFnxWBeGtVwPxw1NcuSIFH2IzQ4OYO9X83uMmc8pa3djhE0/zCKplytTb1fLDvM2/VvdihgWw8xM11NhOACi1e4XQK+OID9FaObmrfXWiiFrJigHjGMM5FgncFgoQMQgokCEbhXomFQkyvqW4wS3naDqGYAKTiWGiqq3XWGd6Ok32fQxc1BICsOD5JwJ+Hy208+E6t2YRNCB5sUXTIwUuG4y5dPXuB7ifHZKJ4tPGhTvGkcleba5jQJWUFpqyBfe0GDb7a9c8HKnrv6U7KsRx3nCmLQnELUIhI2XlMcRuLwJDTMSdmOxDzpv6qy4nFULh7k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb8f150-fb4d-4a9a-cc98-08dcf2bcbcab
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 17:12:41.4225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eUb3z3E0K7XS5yIJDg33gBDXgKx/Oh6rdyZRKj+ouZd4j/gA9SfSQpK3HzO5yLZFVsLJRRwS+UoQxci7bZaS/HZ+DijnbulcCMYA9amIBDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4544
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-22_18,2024-10-22_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 mlxscore=0 mlxlogscore=873 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410220109
X-Proofpoint-ORIG-GUID: i0yXCAi2zF1I_MAg_JNQ3QTIHvvOgb7W
X-Proofpoint-GUID: i0yXCAi2zF1I_MAg_JNQ3QTIHvvOgb7W

On Fri, Oct 18, 2024 at 08:58:05PM +0100, Nick Alcock wrote:
> We already validate that they don't exist in dof_parser.c, so no such probes
> can ever get here.  Handling this impossible, untestable case has just got
> harder, because we'd have to skip DIT_{NATIVE,XLAT,REMAP}_ARGS records too.
> Just stop considering it.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  dtprobed/dof_stash.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
> index d9731844066c..cc2284aadbc0 100644
> --- a/dtprobed/dof_stash.c
> +++ b/dtprobed/dof_stash.c
> @@ -585,12 +585,6 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
>  			if (err != 0)
>  				goto err_provider;
>  
> -			/*
> -			 * Skip probes with zero tracepoints entirely.
> -			 */
> -			if (accump->parsed->probe.ntp == 0)
> -				break;
> -
>  			mod = accump->parsed->probe.name;
>  			assert(accump->parsed->size > (mod - (char *) accump->parsed));
>  			fun = mod + strlen(mod) + 1;
> -- 
> 2.46.0.278.g36e3a12567
> 
