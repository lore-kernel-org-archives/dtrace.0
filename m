Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AAF27735
	for <dtrace@lists.linux.dev>; Tue,  4 Jun 2024 18:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717524030; cv=fail; b=FaPji+Q2HGOzG8bsZRQAPqReHIg29lWmeWsHSj5ZASfOyE3umLuVnQzoI2VvvrXTKCkwdZ3Kx8iRjmDId6lbZsuOSShX4V4XdpfaNo4KWN0ve5EDj+27NVAvB9Rci3Yb5jQlK1dZ1FJ9habFreSYp8d78ERoimmE9xE8ZDugesI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717524030; c=relaxed/simple;
	bh=Sm0StzAMkte7Nl6jbQUh4eax0HElym0ok540EabZCv4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D2DjK7jsI2/oyG4622PHmxLbrMEeSkpq7Zm5nhFh1yOIHYLuvWHuNMQGt0gd9RWJtHcfcgbijlBCdB9SCeSsWvY2odaZwlbEkkuh2x28kqJEJnMsmq/Uf4cQEKUIWrz4AX1hxbNdjmkjZHk8AdmCp+7m1RIFmDLWRv4SOFbaTQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 454BmnpN004602
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:00:25 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcontent-type:date:from:in-reply-to:message-id:mime-version:r?=
 =?UTF-8?Q?eferences:subject:to;_s=3Dcorp-2023-11-20;_bh=3Dp03pX0lCQSSp9tg?=
 =?UTF-8?Q?cK9G7myyNsFuPsx8glAtopjP+1fA=3D;_b=3DIKgpYNVwoKdakJsykY/JyeZACr?=
 =?UTF-8?Q?Sa3cUYnCxg9BXTpqI6b+1FKNxsruIWfaBR85SaXS6+_kdqpZC1D0minRYSn7+ho?=
 =?UTF-8?Q?l9DODoZ3XsoLbXRlDWLxEzMMd5wmOWFfkVq+BeqMPsecNIJy_BpHYMNetSuyF1m?=
 =?UTF-8?Q?CdxKxcH6Hr8S7I8KsMK83PlEr9ZYEQ/bHkTMJo4rnIXQ97Nvex+4lI_huMSqyRP?=
 =?UTF-8?Q?PIK8rtCuMHP8d/jU4HK5v+hNABjEhdYMarOMqL4J1IaNSLU8CGIpDrLYPZd2_ov?=
 =?UTF-8?Q?/Pc+nHSWYu5aw5o+0HDmon1vDdqM54Qbb2gncaHDGp0vx7bQuWrQ3FULwzQjvU7?=
 =?UTF-8?Q?c9l_sQ=3D=3D_?=
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yfv05dn87-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:00:25 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 454HbJ6R024002
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:00:24 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrqx6whx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:00:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EgWGGy2POJI+VfWyEG/D9x2Agowb4xdnZTpZ0wAKtZ7Vh/qpAQ7Ingh9VFZ87dQh5hga2huwsm9eu2O458SCcNmi/u/t3XjFfwCWIfH9YokBCf7pOY+ljCTeNz2H/1uNZPiRkyXA7MBPMuDTqyMYlEMjVmqaMro92fz02Y9dXBIXcxSeJ7bytSScdO6fKWvOY1yB1h9STa/pZmjgDFMP/Jt51bZ8cxRrkSkBUs9fpXu3vY4/5FmQRmPIfGrhhirz4z+nKxRHe6eXwq7W1MTwbuGtCm6EPtWoB03oKgRhXaPXtgvoeNifAIbjqqSP9DUO6CDG/y/0lfa7D1JA0FYd6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p03pX0lCQSSp9tgcK9G7myyNsFuPsx8glAtopjP+1fA=;
 b=SMMpcK7cFfyM55iJoEwOGpGowlotPvNd4U3xsooy75/XL8eTTMDDBTHQpGVb2BLdhK0JwjBF/Qt3H+FSRRmBjRJm6pZvHyKLHnoro2kGKOzU70vgUTU8PMevtB7gtQgG/fTWjFg5M+igqENfBtzsv4FY8RFslBXYuFak3zsjEWC4Sq7fduodY8n0qsWKPcz4GZQmVEkcGW7ny3IeFp3/KK1uHmy5mJeWie/5lFu/fSd4O8AGhDCsY1lPgHjOjytG49h/k2pV9S5ri07iRDp+J1ZNL4ty15hVeHNNcRepkRbo+zI6t9USCj/lYIqfw4HzydlQFWqOk5JhI/7YrpYE9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p03pX0lCQSSp9tgcK9G7myyNsFuPsx8glAtopjP+1fA=;
 b=V5Kh/o/W5n9oiozp5Mm7lyW59O4EuZ28dr1wtLAefZ4mG/WZwUBWrsNbvMcjD1vihNsB8lwPE8C0uQofMTOgh273/aTChq2OsFA/dMEPS/rj7wXqxuQLPuHlbMnFnRE79cxtMt1COCPREP9q2CvGIvnEffvbpasptxiWBeBQ45o=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH8PR10MB6574.namprd10.prod.outlook.com (2603:10b6:510:226::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 4 Jun
 2024 18:00:18 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 18:00:18 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 5/8] Fix stddev() carryover computation
Date: Tue,  4 Jun 2024 14:00:05 -0400
Message-Id: <20240604180008.11331-5-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240604180008.11331-1-eugene.loh@oracle.com>
References: <20240604180008.11331-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0080.namprd05.prod.outlook.com
 (2603:10b6:a03:332::25) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH8PR10MB6574:EE_
X-MS-Office365-Filtering-Correlation-Id: f6ee486d-f234-4f13-e483-08dc84c0320a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?a2ZDJ6OK52n2JcZQcm0xcPHG9TDIiR0NGVwf85eaB2vSSaahKhpaA8V/43+z?=
 =?us-ascii?Q?Tp+dnVdJhqhT0CSCH6vcig1ox1eY/YEJxxpThXtRlTLwvOy2nAiHhk3G8Ndm?=
 =?us-ascii?Q?dSvwKcDtghQFHGSRk8OikVdDIEpEvvgq9BJRORlTEAxDLUZgsd8rlMF8PrHn?=
 =?us-ascii?Q?HGdLG0abbmmey0JivIaksoQt2KDHQCRrVvgNNWoE8Bjxo9GKumC406dTezlV?=
 =?us-ascii?Q?C90yCFfpiAhZi/ynMmwipazzr/69otfFo0M4gIGng6K1GSDZCSe9dJc3PLoM?=
 =?us-ascii?Q?/hkak5OsWcOvm+F9DaKkhfUcQbfOCdO/udLhDGKngL6P8LTFkQwnc8dvgXZW?=
 =?us-ascii?Q?Sspfr6PuimWoM6HmW5/J9cvESFtgeMgesbs0XvuXGbfFfhlSiDA43j6FKrUM?=
 =?us-ascii?Q?+o3jf4kVlwXibm8G8o+SjyM/mH7J88JZLp6zXWOjTgKi6YY/sPE6gXxSC3lZ?=
 =?us-ascii?Q?O7XHqhl8Y250SmPlJKtIh849rMs2VcGwFqF2M7mI2atyR0t2FHJbkuv6pVmo?=
 =?us-ascii?Q?D06OTEJF/11iO4kfsF0Q4YPuXME9VFyLZ/AiIOYaPAqe/I4QRCMxHkpPEq7L?=
 =?us-ascii?Q?iftmXC8XuK4ozavqTS0l+AwJnmqHT6XpE97x0AYzKw4qU85BdQYSE5xzPez5?=
 =?us-ascii?Q?n8+mV7ZoXmNe8LP4Z+CqgCf/lnZMj5G9CisdHjtV9mL8XtkVdUbKQUzFt+SW?=
 =?us-ascii?Q?EOcGOqbdtFbjKDQ8TjfXaE7wMP90Yf3tgtydbR/AFhaGwIQxSBS1fRSp+6Hp?=
 =?us-ascii?Q?Yz6D/zi3iXY8FYjrZMdOyZ78LkcANW3BO258v9bdPDKqv0HEX/B7jA/pLMEJ?=
 =?us-ascii?Q?GR3gvg+QjIpLSLS8BfLD5XN+tp1+cgqLR2lX1JRFgyMO+RTQ0x8MsicGOxYH?=
 =?us-ascii?Q?d0QYXAC4CFBHhxsAhvR+YU+Y1hwKMlT1uEtFlcs1LN2QeeoqrD6nv2OESA8n?=
 =?us-ascii?Q?K2MpvBsSUBo8xxHmDstbcgZnhSrje3f6uj/PxqQ9A1wtsMdufgOYvgEwJO2/?=
 =?us-ascii?Q?g9eljEunBLMPLIVmCso4gL7dFkkKN3J3faOkPPvjcWk3YaeY9zSVjkcI3SD0?=
 =?us-ascii?Q?HthKSmh+2vRfbX/0SXKUYxdKYkT8ntKEexEUjSkXPmpQwfh5/lbVVd3nv4km?=
 =?us-ascii?Q?Zse8cQ6+NwUO7PNbUtN3kIBjLSvB1jjBKRTQodyPI1d4aLOOfdYucHAEfbUA?=
 =?us-ascii?Q?6ReykSVXnh1bKozEfx2HDv8uZkpL+WhhNs8DhEgdrrPrLg4GlynV0evC1DMd?=
 =?us-ascii?Q?KvACcYBB0UtdOcL7n9yXbcf77vqUCafpOr/dC+L7ZYE1WJDI962luyRZRSY5?=
 =?us-ascii?Q?ZOPHKVMwjQi0PqPNIbOeunMs?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qH50k/J2fRSKPbMpCoq8xQ+VJgNW2L40z90xh3hk3WOoCqo8oNl5w48qeV09?=
 =?us-ascii?Q?1rYKIBg+aCxsuI7V1m0uGuywEhnd+49jhv7URV+xuDqc479yiHAbCm/cybZR?=
 =?us-ascii?Q?rizJ0Q/2SiTRNnjEws/iYnVbdYzI2+wJ9cJ/rkNYK2478fODx4ah9TR+h9dV?=
 =?us-ascii?Q?GokqPXA3kXQ8q41xn4vFEqV82J0DoPYYCqhDUyt63+scCe9A0YlsnCLGch9P?=
 =?us-ascii?Q?9EUARJJy4RuRdguYK+9frvAFQGChHu2VacsPhdpPB4y9yQvKqcKh2Kw09lQY?=
 =?us-ascii?Q?YC4jSkAJMMkUS6xw/37/QEzaHvDdbZ3ymv4mP4nO8JPUdknZH71wiIKWkQAJ?=
 =?us-ascii?Q?V68Dc6AEiP2AsMiGqH2P7Zajx1xveSTcv1ViZMOi9Zo/tW+IdaBzI+4f96LM?=
 =?us-ascii?Q?c4jhJMWB+uZBWlzG2BsPnMCQwIeE1/PQ9Xrg1txZ+ggRLJeRN78MUqRMJDf1?=
 =?us-ascii?Q?p0mId8LdRmPqtO8B45pzmDBvzCD8JiOXH1nRXee9WTuPcbAZKNSboH5SZz/f?=
 =?us-ascii?Q?U8iyn24Cj4yH2mgsynCeGqEtlUTBiZ1J0EKySFBsS8BqmWIvs/xdCwLKyLkx?=
 =?us-ascii?Q?vcegee5f7sefH3aXIw2rVFPx8nQexpcsJsoa+eL56ZW1I2oESL0+zmTGgb3r?=
 =?us-ascii?Q?bdW2hrE6GvtMVdj9+J9ap8lEUN3C8ZCebuT+Xg5RyvTYYyPGxj1Xg39o2HCt?=
 =?us-ascii?Q?qUwHMqIHH5GbVLsWReaPm0DR6HpWNQz2PZiwZEEzU/0juJiZ7jQPi3JdJSNk?=
 =?us-ascii?Q?Eo1g5pxBPCaAq7QUHLduh9GzhrrdUrSNNOdlxCQPjSUj7GJC0XUb4yGZi1SK?=
 =?us-ascii?Q?Lwd2yEH5+ZAxd7iBBif4CKIz/akBJIa4S6d7Qz4+NafskTRjBT8JhvynuqIM?=
 =?us-ascii?Q?sOmrmHnWS59rwaC1KggezTOfjmRLd4y454+gyCcVUivWBgdbCFQQX88fnaGu?=
 =?us-ascii?Q?CEebmynW9w8OIiHoPeibLLM71PB2oX3DBBTBjCLgMe8pM3B5ynAac54UCDh3?=
 =?us-ascii?Q?suiiBHX5SdZ1oaw8A6H5xqYa9rFUKR7+UiycXJ5o0ZxrTD04k2hG9yfWMtLJ?=
 =?us-ascii?Q?DDP9SDEpphId8vepHgHxIUCasW9AQoWtCPBIX65AfskCXzTo7zB+P+8mvV83?=
 =?us-ascii?Q?bJnxKpmL9dCYh9TmQCM35KVlh8Ea/Kyhvj1po3ddyZCI5ejKWk+WzTPD43iW?=
 =?us-ascii?Q?fzxK5uLBW7Dircn/MCm93wdrUxkg05PkRB3sBiSCLeteK7j7c/G09N5v3P8W?=
 =?us-ascii?Q?jJFgWpzymipLUO8L7lAD2O62O+IJr3hU8jC7jyoBa70aElMUMtUlsszNL0FF?=
 =?us-ascii?Q?oKIM89APD5d1AvqCVDKbQb5l0dxGQYqvnmHli+orjUCTF4R9EopuUXg8c/QA?=
 =?us-ascii?Q?7hbgDwTRkrN1KDbpjtWEdrCkmXi7mT5XQSeSLMw79aTg2pkKe4k8xC/l6KRh?=
 =?us-ascii?Q?fHyYE7F3YcrsvnKumg/3uJDfXkESrk7Pf4H5wxWjYbOwqIy6hhYdLzRJLmN3?=
 =?us-ascii?Q?QNuh5AVam10g6jK6EHpuqAX5uGm7/JxdkMuIhJjLM9doy6850a50TfIu3Ncl?=
 =?us-ascii?Q?MRJpMRG2t8LxkzjMVXleg3BS8s+N3NPcjC8r/Fhm?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	BbuiBu2BM9rUZzfL1irHXTEK5mV93HpnW19o4myWLy/ow4w3ocsWapxXq8vQPCs0e65YPqAMz38xFsDCZQRNISXfB1OwRrgIQMyvVaGiloM+ZkCaamGDwTwJK/L0U1spN+FaPDR6PrlLOU7A8/gI2dNtQvwBH2SUJ6IKwMfcZu0Nx7NAo512WuCbpaue7yjUHy8aCk2DTG/f/+m3fFOnPgg+FXld2sjCpJ4ufGvLW07yaW3d1yY0DZg+Jpb7J8gI7C7JEdoKI1KjyVqcySEpGTDshW+g0Pk3T7JBcHJuV9jm92KE7dQ/de+ebe9QeWmPcxKrUW9VdFv0GO6mOoG2GNKbCYL4COaAy0dFsfOGNJeLskHzw6EyUXZHAzLoviy11O+4nBc8VDy+ICSQcH9b3J+nBr6acS3YhBZUDccDOP6hAvX6OjldtbzqQ1embgMNJokDVxEXxHtJCtKk6a6HIy58nMVRl/b8PnnHZp2sWLEBRG/Z7uEbELAvpT2xyrqGUbvwzXSpD19jpoPeykKMTII4VaFpEGx4+cfaaLfq5aPxzH46Y5H4D9TObjTsX0f9tvhO3nthY+Pta3eKjlut9e4qxIziQ+6Zupsg4fzBro8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6ee486d-f234-4f13-e483-08dc84c0320a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 18:00:18.8897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hjiqs7dgW4sleI3enRk+joLc6Rhbx/nB28LardvBVbPeCVe6w3BNLT1A+6c0+zfwIHiBJd/x1CyvhXi0QInZ1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6574
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_09,2024-06-04_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406040144
X-Proofpoint-GUID: 11mvtk3ydFtu2s7E4FJCr8B3sVb6D0Xn
X-Proofpoint-ORIG-GUID: 11mvtk3ydFtu2s7E4FJCr8B3sVb6D0Xn

From: Eugene Loh <eugene.loh@oracle.com>

The stddev() aggregation function squares 64-bit data values.  A
value is split into 32-bit high and low values.  Then, (high + low)
is squared to produce high*high, 2*high*low, and low*low.  Each is
managed in its own 64-bit register, with the final result residing
in two 64-bit registers.

When the 2*high*low portion is combined with the low*low portion,
care is exercised in case the combination has a carryover portion to
the higher bits.  This check was broken in the case where low==0.
That is, data values whose lowest 32 bits were 0 resulted in
outrageously bad stddev() results.

Fix the check and add a test for such cases.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_cg.c                |  2 +-
 test/unittest/aggs/tst.stddev2.d | 45 ++++++++++++++++++++++++++++++++
 test/unittest/aggs/tst.stddev2.r | 13 +++++++++
 3 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 test/unittest/aggs/tst.stddev2.d
 create mode 100644 test/unittest/aggs/tst.stddev2.r

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index a1c24e37..fc2cebf0 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -8290,7 +8290,7 @@ dt_cg_agg_stddev(dt_pcb_t *pcb, dt_ident_t *aid, dt_node_t *dnp,
 	/* Add low value part from mid to lowreg */
 	emit(dlp,  BPF_ALU64_REG(BPF_ADD, lowreg, lmdreg));
 	/* Handle the overflow/carry case */
-	emit(dlp,  BPF_BRANCH_REG(BPF_JLT, lmdreg, lowreg, Lncy));
+	emit(dlp,  BPF_BRANCH_REG(BPF_JLE, lmdreg, lowreg, Lncy));
 	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, hi_reg, 1)) /* account for carry */;
 
 	/* Sum high value; no overflow expected nor accounted for */
diff --git a/test/unittest/aggs/tst.stddev2.d b/test/unittest/aggs/tst.stddev2.d
new file mode 100644
index 00000000..994bc3e2
--- /dev/null
+++ b/test/unittest/aggs/tst.stddev2.d
@@ -0,0 +1,45 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Positive stddev() test
+ *
+ * SECTION: Aggregations/Aggregations
+ *
+ * NOTES: This is a simple verifiable positive test of the stddev() function.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	@a = stddev(          0); @a = stddev(          0);
+	@b = stddev(       0x10); @b = stddev(       0x20);
+	@c = stddev(      0x100); @c = stddev(      0x200);
+	@d = stddev(     0x1000); @d = stddev(     0x2000);
+	@e = stddev(    0x10000); @e = stddev(    0x20000);
+	@f = stddev(   0x100000); @f = stddev(   0x200000);
+	@g = stddev(  0x1000000); @g = stddev(  0x2000000);
+	@h = stddev( 0x10000000); @h = stddev( 0x20000000);
+	@i = stddev( 0x20000000); @i = stddev( 0x40000000);
+	@j = stddev( 0x40000000); @j = stddev( 0x80000000);
+	@k = stddev( 0x80000000); @k = stddev(0x100000000);
+	@l = stddev(0x100000000); @l = stddev(0x200000000);
+	printa("%9@x\n", @a);
+	printa("%9@x\n", @b);
+	printa("%9@x\n", @c);
+	printa("%9@x\n", @d);
+	printa("%9@x\n", @e);
+	printa("%9@x\n", @f);
+	printa("%9@x\n", @g);
+	printa("%9@x\n", @h);
+	printa("%9@x\n", @i);
+	printa("%9@x\n", @j);
+	printa("%9@x\n", @k);
+	printa("%9@x\n", @l);
+	exit(0);
+}
diff --git a/test/unittest/aggs/tst.stddev2.r b/test/unittest/aggs/tst.stddev2.r
new file mode 100644
index 00000000..16e17736
--- /dev/null
+++ b/test/unittest/aggs/tst.stddev2.r
@@ -0,0 +1,13 @@
+
+        0
+        8
+       80
+      800
+     8000
+    80000
+   800000
+  8000000
+ 10000000
+ 20000000
+ 40000000
+ 80000000
-- 
2.18.4

