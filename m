Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A85D21422A
	for <dtrace@lists.linux.dev>; Tue, 25 Feb 2025 22:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740522449; cv=fail; b=hDj658d6PsZ0/BnAYEtiOTILjdOqIKLZXxubJ+Rx7ezRKmYqZ6lJ6MUv+9SsYRuY26zHgg0tBSQZ0+yvmJwqjuvgvpGjbeJb5UyuxRx+XYdJv6+yXKmYPXBHSOmanmaYeDv9txy9rr2DraXWe5B8+of9u5LA03Qw0uzlJhlEw9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740522449; c=relaxed/simple;
	bh=TRsL3jcZ9fCzpAuPrf6rEemspny/WRdc5FLj+FsJTJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=szffDdKhJUDKdhUMDOTO2KXS0mUUzd4mU8w3Yy08/ophq/6hA9Zt2awg6x4QRiopPIChuPUM9fGF07c6VcdH9Zxiu36CUkBDL+uOSpEwOd0nOQ42uMSvuWDUaP0/uUJ1OyjkD82fe4WmbvOHkZ9zUnKgN5IkUsOWaYLIUlntgRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DD+IqEAt; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=I6m/CsCN; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DD+IqEAt";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="I6m/CsCN"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PLfZVJ026087
	for <dtrace@lists.linux.dev>; Tue, 25 Feb 2025 22:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=vNV/KaiiVWX8I5c5W4
	84N4XNrjbRdEj9GHkH4+32TMI=; b=DD+IqEAtemZrLRBRZlGIr68IW9f1fHG7S5
	fJBM0NzSMQyfEKNg+XlhrWFg3rn4aHecPWm34I4ec0FWJyUUX6QLSj5a1vtv//39
	8nfH1NYjp0X92AcWhOOxxdK4xZh2BcjC7TM1TwWRjSSLCgbxvElREo8CDE16MPVO
	EciTMmdK1QEm97tsOnFGQQlEyHg2LSa3XPExkpvqh0a8VKxdks34wu42uQ5JBmMA
	2Fj/+PLGB273b7GpjIjSXuJsmFavXBIoNqMidh9dmvYQbyMwYb9AS9iK0o/mYfkJ
	NqgpgAj1Oh0gz9/tNaNADaErGgjcxRPGABnup3qbIa+7dB6/Dxfg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44y74t6fyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 25 Feb 2025 22:27:20 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51PLHb9j008185
	for <dtrace@lists.linux.dev>; Tue, 25 Feb 2025 22:27:19 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2049.outbound.protection.outlook.com [104.47.74.49])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44y51fx6bm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 25 Feb 2025 22:27:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQLeJUrksMwaJnyF3ZkIEsHyMnNH6v0NOUFzzXMJfNHoNZBFFMj0vClVk8uuzeTTYDgjxGWoi6VgE/k0zY+p0ILa0W/IeX/pscN99hC9ARgrwgODisuMrz/Qe+FG2RTSk1xqKC/QMVGg9Hv+sJkLryvROIPxUbmgdLfSdnZwg2eDxp7V1JcG/WDwMiBxpOmvCMdMMTcKM/0Leu8ElOmTwbEvjEei9M95Hc0jp2wc66u0XT9rFyKDfln6Q9KGTkIk809/fjy2dyxg24E9CyOK3Z5ivG6Cn2eVD4MgPxrWpV/n9a/wpiIxo2G7+4P4PaDilqbuGLcyOszQIcBWmygOLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNV/KaiiVWX8I5c5W484N4XNrjbRdEj9GHkH4+32TMI=;
 b=pKBoPJREkDH4qdetJkZmO39zTlcT466VVhUrhXEYzqP7xCZWTnjbLu2KMAOEmOQqhRsbyBHcY3ut95zj7YodKZuif4JiDQK9HfVXIX6t8AMa23HcRpZQLxCqXq/39vHOsQgmpDyowixGAmR87xPe2C6RC3inzbH88wwiivoHRXEIw7pjCQKJ+4QjfvuhNZghVqsXvjoyvAmyoaeDOs0QxgdeANGEJPRfHXMOoHZ9v6I78JSw0MF3e86hRayHp21OMcRAIWSVLJB/cf9ndXGnoPvlYdDGIDqbr/hCt4UIV9n62jgZIeMbIwmEaV46UYI44ufyEbwuDhED0JhSazpCYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNV/KaiiVWX8I5c5W484N4XNrjbRdEj9GHkH4+32TMI=;
 b=I6m/CsCNpr8QlMWAO/rRpxm/YoLIrqF9vUPSHdBsR1FShPR3m6JWD8oy8udxYRM2eCgqUfmwuii9ZenXw5KVmWM1qcaxJXZsmTsgsygg33Y1es4PeyCHK2E2N/HKnraD9rp18/9xjZgZsjheyhIyMqPBFV19g1Ca0xil99Pzb7g=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by DS4PPF6D651AD93.namprd10.prod.outlook.com (2603:10b6:f:fc00::d27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Tue, 25 Feb
 2025 22:27:16 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%6]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 22:27:16 +0000
Date: Tue, 25 Feb 2025 17:27:14 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3 6/6] Add support for pid function "-" with absolute
 offset
Message-ID: <Z75Dwo1+VAWqD73e@oracle.com>
References: <20250221000831.25523-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221000831.25523-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:208:36e::27) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|DS4PPF6D651AD93:EE_
X-MS-Office365-Filtering-Correlation-Id: 574ddf26-e080-4d99-f5ec-08dd55eb8f47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2xSOq+voMshcOeaFnW1bsHGqfO+Lf6RVGrFJFO5P2yXOMhpIy+NrS3s00dYq?=
 =?us-ascii?Q?hS3bXBzQBcwOVSZw3iOQSIy035icMIY0BKUaCHSIZIfCybiFsm3gpYjV1inv?=
 =?us-ascii?Q?uFcY+DJ+xtc8mcvf7OuJuH3vFjGbrBZxFhXZOljRJQqX96WyaqhY/HnSz0HI?=
 =?us-ascii?Q?JTcXE/En2UiwkrEeG55XKYiz5JM+914Bafd18SOxL62L+zTWZ/Pw8yIkDrlv?=
 =?us-ascii?Q?ZZFup1IraVgDVuLCTjg+te/IYhNHj9w+vzK5oYNMyujwTF1/yooGR1p1aFoO?=
 =?us-ascii?Q?+L/8jbb/llsMXJLxfyn1PIq3QO8s1jrndN5zy3bvUcHoqtzVsUVn1QTQ8LSz?=
 =?us-ascii?Q?dyJULSgX778G5OaSZrSMOzIxLufpghZNxIqY/G/vmyx/7IUsGkdCjbZ+KzO5?=
 =?us-ascii?Q?WtEoMlj6DmBEJIVKxNHesxzhA9YZTJniNKRZjR8iAHCpqzhOvRopghhclXqL?=
 =?us-ascii?Q?x8KZCaw3jnQ4M8WlIazKfEgMxcjwgqMPgvRtH/BLhU3/hCtDyRZulUifZul/?=
 =?us-ascii?Q?ZEdAJoVRizg+L+MltA2+yjj4lnfaeHfZ7pARs5Jaz4iGQEQn1hBy40MoipZo?=
 =?us-ascii?Q?r7CH7Epst+LfmvZITiqplwisT7Q+BskhcfTR2yRyJhdGSa2/ZuLNYBpGwf4V?=
 =?us-ascii?Q?kElxkFV7Gde0ej3LSVNr3dk+YpZVF+bi8esTc3VStbjjCAZhxSAQikvrQvF2?=
 =?us-ascii?Q?qy+mvyvhr2h6pTf+Bc9wHPZB2mN/FjnWT2tp+WxnI6pVNfkgXONrYGOM0wnB?=
 =?us-ascii?Q?uhkpX+8XsV05odXAmxIK5czGOxfTKukvXriIgXujBJXvJLvY4wkdfcr8icid?=
 =?us-ascii?Q?0+XgjFiDJpR27qodJDR3OjwUKuHH6l8snhaa3IbczEv8yf+GVPFA2jrV2P5u?=
 =?us-ascii?Q?C9mcVl2BbeyutByRkjO9Lkw3bzAYVEGtmJpx5LG7WFYTL+KGFwCYRa3QX+u7?=
 =?us-ascii?Q?2C8LRdd8VI97DnWEQUfHOXn0pBUE7/Dy72U5B4RYR/MAnwFtFZPXZB2har4B?=
 =?us-ascii?Q?aFsuFuqNdprJcCaRD8jkJDBJ+sjSjPdyGNHoXYAPZM7c1Nv++b6QaA9/2Jn1?=
 =?us-ascii?Q?JkaUTcebA65qwyYl5SSmEJi3p+6tL8JfZe1krxUsB9nFCG5oatkrRhcJ5MKr?=
 =?us-ascii?Q?ZTbyob431ANq9jQKpmnpJuQrP3yxT/8bIBW/yMrUpWDvmsTVlPwXr5Af6lyA?=
 =?us-ascii?Q?38E8444r4bWGEH1WU86evbozfmX3COLQXsYMyrA0QLSs2uFb+olgNynYWd2a?=
 =?us-ascii?Q?JNctVLaAG7g0sT9xqDPOVHVkTOurUtqV81qEW/C/lbld6kaMXVizO9hFfpdw?=
 =?us-ascii?Q?eN+n6/zjA2lPcNofTk0g5ffahmUwLIjz9BArqKYvjRdC+A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3q9KJVLoFHw9ScHKgsicP4g0tXLA2wovWHRsSSbSj+UElg/llyLJ2Lt9ZuiE?=
 =?us-ascii?Q?h3/frMbhamGVW96KUIQsTrCmofdHALKMHJkd3vFScApEoN+JtFAGLij/tRpk?=
 =?us-ascii?Q?fx1oq3dba2bS5MeLTmwDHFyloApnvPvtQ6MRCBbEHcDf4hak0r6JOHubE4sl?=
 =?us-ascii?Q?k1qfIcfI/3pXUlnMMJDSHcLHG2qJndzNoddSfUCMUXB4cBLvt6urqpdCDFo7?=
 =?us-ascii?Q?pL9I20WpZkKMCE/wcTRvdPCqLRixqlb8X9uF8ROubYBBF0t5pcZpgo9ueQJd?=
 =?us-ascii?Q?hjVU/B+E5HuLUgpd2z1zzVBnT0u3HYX4VXtPqMfkzu6jG2edWx0/etSBiM1Q?=
 =?us-ascii?Q?UfOs6eXmFKqPty+W3S3tYE0WuzXSuN344rnONqmRvVLF5dp8S6lzXU1dYFvh?=
 =?us-ascii?Q?y8uksGiyRicZ0DXVySYfMlWw41MSytlYLI1L9t3QMEsk+S3jr2GhKwYXkx/b?=
 =?us-ascii?Q?w4ayFXUsQxO3cfMTxJO7ma3L9tY0Whokge6sSZZ2H2aVI1sqSv6m4vXNchzl?=
 =?us-ascii?Q?4RylHlOFsQaNRPSCB4cq9CxbcrsuKoNsuSV9EnZxGRTNWU/FvpOVKH3a4HQ/?=
 =?us-ascii?Q?qu1O4AwqtG9ylUVRBIaLQPhGhC0Fdo9LLDbp4dtYULQvMmtZDdVcTE61A5GD?=
 =?us-ascii?Q?zkfP7HZI0bAhBpqAQicgkqYT9tBHFV9M6P46wSYaah7J6A6uggom+c97Gy4w?=
 =?us-ascii?Q?/8G09sFvln3pVuB/e330fHjcQhR4pbqRadVKtpT633PUb5xmj1+d72LTMDiy?=
 =?us-ascii?Q?YKJPXIfTi2pP9bkuedK8CIKgBa3lr0VGYhmjk2bUGz8uY+TxDvEpnJV1MP4a?=
 =?us-ascii?Q?50lYVPKfzkys5MsIabJXu45x0+OULv9sjW79bmvi+QfDBaW2Re4lCKUbeHaY?=
 =?us-ascii?Q?wWf/E6QnTOE1pa/yblPeZxsITfKwIL9U5t8WX6kHFQ6oipj6nqUDenrN2wE+?=
 =?us-ascii?Q?mWlcZc225P9B1OVjIQEzHprF6J0Z43JXKD7rUs4y9RqwQW+ynYeGEF4IVI6m?=
 =?us-ascii?Q?5i+yj3PhiMvWgzm4LzIfWwjE8Pncj34ph1iwbQ/egx16Q+KnN8QFxwt4D6iG?=
 =?us-ascii?Q?99rWl2uuSNPJlUa9Jke85rf8clz58mh6aTcjIbNbCGqrttm7tza+iqC3YLhT?=
 =?us-ascii?Q?fKsBklzDeWu7Hwf7R89NjHFPckWNoz+X1zk6C7CYPfHp5sTw4zEq2lA8cbtr?=
 =?us-ascii?Q?ROtD7U46ni5tetYNyG5tpidt6PGa+1c+l7Fn0qiggXhcIyGq6dJMmgaUWVUL?=
 =?us-ascii?Q?rR9IduFoC9Glmeu1TLvemntre7CUZ64v8ah8USlP5q3JjVswm/lc6q/Krupp?=
 =?us-ascii?Q?7JrGgSXv3gwPsMz2uHvKJcXcWlrqq8Ujkyle305MhIKTuWYfNJW69XOPY3Qx?=
 =?us-ascii?Q?QtSnzdBD4R2PbiPQOFpM/5css6bycjjYWQO9KDPr+9jp/m2m4Bp39uFyi5Tg?=
 =?us-ascii?Q?on2CUxX1MiVDc7I5pNR26dQ7K/XA65zSWaPE/BD0YKFc9zobjxnG0FiiIrPF?=
 =?us-ascii?Q?hcmtrr2a/5K5csltzspCczbfFGxMsyvQTz8rtj0+0LkB8BKzJcohhWJz7K6H?=
 =?us-ascii?Q?zdThNfvP/nnRHMiyVynkABXj0eDDvm2KLQl8FfjdX1efiDwUPSLRmzj+dgw1?=
 =?us-ascii?Q?FQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	W/NSCJerhuJWwDLZkw6QARcrEtC2+nZqRo826Wl7nqdsaEaaWTt6c2tJ4aAK16XpxC2xJA0+jgfsRm3IFLL0PlJdxOEz3P4GtUc+mGFh+y9maOppJDJeT8Rm+jjXGEbz+/jxeq7yTqXmFSyKlMZKVc01F5hR5++5y+xrSWcd6r4QT7ESijZmQDOpoXfMzNDKz9QpyYIbFek5YYiHRit1Sd3QDnGGuJrfGREBeNd36a5mbneyF0/R2btk/tuVDNTZ9eqIcIoEwjgD/FxeFrN59OfbpQxpLK3W2VOW+J6mfXnjjTQFQMcamjDMKKwHHYOuKXErRJjVvEukS/XAeSUFsVGslAkiLh4nOCrOnlFtBUQ8qZvWUvHHesgPg2Tabg1ETlgohcbJ4FZVeBn+FuSffSzbl0QYXE+TzAOZNBOM8bJYXXqf1IVMSPqYu4E2ddoZm80blAfPBrcYrwvtTz0Vn+26/sIwsDGAFmPneaOgO2lSoJR2QgYwVH0hoMiHk+yodqU6Z2jt/lpCuSkNB0WYE4Z8niyMeV3tVDJps3tEl1IsLSvkvVaU1MCJ2obdb/5o/EzonUAnq1Ti3MfQLqrqhk6vn4tdvG1zor3LURRcOrE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 574ddf26-e080-4d99-f5ec-08dd55eb8f47
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 22:27:16.7714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mwFx2XkvIfwvVfAlp877rbCmqNrfVH3hSqbBkBt2kjQLGFKbMPjLvbkriUDE9hm3cuz7XGNCB/XmMRuGAiXvekiJ3vL2m0DwEMxGwE/awnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF6D651AD93
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_07,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502100000 definitions=main-2502250133
X-Proofpoint-GUID: R1Vqny7h4AIuCIMS3Kb6scwRW6dOm_rC
X-Proofpoint-ORIG-GUID: R1Vqny7h4AIuCIMS3Kb6scwRW6dOm_rC

On Thu, Feb 20, 2025 at 07:08:31PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The pid providers allow users to specify a probe function "-",
> meaning that the probe name gives an absolute offset.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  include/dtrace/pid.h                |   3 +-
>  libdtrace/dt_pid.c                  |  79 ++++++++++++------
>  libdtrace/dt_prov_uprobe.c          |  38 ++++++---
>  test/unittest/pid/tst.dash.r        |   1 +
>  test/unittest/pid/tst.dash.sh       | 119 ++++++++++++++++++++++++++++
>  test/unittest/usdt/tst.pidprobes.sh |  21 ++++-
>  6 files changed, 224 insertions(+), 37 deletions(-)
>  create mode 100644 test/unittest/pid/tst.dash.r
>  create mode 100755 test/unittest/pid/tst.dash.sh
> 
> diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
> index c53e60047..12934500a 100644
> --- a/include/dtrace/pid.h
> +++ b/include/dtrace/pid.h
> @@ -2,7 +2,7 @@
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   *
> - * Copyright (c) 2009, 2024, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2009, 2025, Oracle and/or its affiliates. All rights reserved.
>   */
>  
>  /*
> @@ -22,6 +22,7 @@ typedef enum pid_probetype {
>  	DTPPT_ENTRY,
>  	DTPPT_RETURN,
>  	DTPPT_OFFSETS,
> +	DTPPT_ABSOFFSETS,
>  	DTPPT_USDT,
>  	DTPPT_IS_ENABLED
>  } pid_probetype_t;
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index 11b964561..76608f690 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2010, 2024, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2010, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -155,7 +155,6 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>  	uint_t nmatches = 0;
>  	ulong_t sz;
>  	int glob, rc = 0;
> -	int isdash = strcmp("-", func) == 0;
>  	pid_t pid;
>  
>  	/*
> @@ -183,7 +182,46 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>  	psp->pps_nameoff = 0;
>  	psp->pps_off = symp->st_value - pp->dpp_vaddr;
>  
> -	if (!isdash && gmatch("return", pp->dpp_name)) {
> +	/*
> +	 * The special function "-" means the probe name is an absolute
> +	 * virtual address.
> +	 */
> +	if (strcmp("-", func) == 0) {
> +		char *end;
> +		GElf_Sym sym;
> +
> +		off = strtoull(pp->dpp_name, &end, 16);
> +		if (*end != '\0') {
> +			rc = dt_pid_error(dtp, pcb, dpr, D_PROC_NAME,
> +					  "'%s' is an invalid probe name",
> +					  pp->dpp_name);
> +			goto out;
> +		}
> +
> +		psp->pps_nameoff = off;
> +
> +		if (dt_Plookup_by_addr(dtp, pid, off, (const char **)&psp->pps_fun, &sym)) {
> +			rc = dt_pid_error(dtp, pcb, dpr, D_PROC_NAME,
> +			     "failed to lookup 0x%lx in module '%s'", off, pp->dpp_mod);
> +			if (psp->pps_fun != func && psp->pps_fun != NULL)
> +				free(psp->pps_fun);
> +			goto out;
> +		}
> +
> +		psp->pps_prb = (char*)pp->dpp_name;
> +		psp->pps_off = off - pp->dpp_vaddr;
> +
> +		if (dt_pid_create_one_probe(pp->dpp_pr, dtp, psp, DTPPT_ABSOFFSETS) < 0)
> +			rc = dt_pid_error(dtp, pcb, dpr, D_PROC_CREATEFAIL,
> +			    "failed to create probes at '%s+0x%llx': %s",
> +			    func, (unsigned long long)off, dtrace_errmsg(dtp, dtrace_errno(dtp)));
> +		else
> +			pp->dpp_nmatches++;
> +		free(psp->pps_fun);
> +		goto out;
> +	}
> +
> +	if (gmatch("return", pp->dpp_name)) {
>  		if (dt_pid_create_one_probe(pp->dpp_pr, dtp, psp, DTPPT_RETURN) < 0) {
>  			rc = dt_pid_error(
>  				dtp, pcb, dpr, D_PROC_CREATEFAIL,
> @@ -195,7 +233,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>  		nmatches++;
>  	}
>  
> -	if (!isdash && gmatch("entry", pp->dpp_name)) {
> +	if (gmatch("entry", pp->dpp_name)) {
>  		if (dt_pid_create_one_probe(pp->dpp_pr, dtp, psp, DTPPT_ENTRY) < 0) {
>  			rc = dt_pid_error(
>  				dtp, pcb, dpr, D_PROC_CREATEFAIL,
> @@ -240,7 +278,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>  		}
>  
>  		nmatches++;
> -	} else if (glob && !isdash) {
> +	} else if (glob) {
>  #if defined(__amd64)
>  		/*
>  		 * We need to step through the instructions to find their
> @@ -449,31 +487,25 @@ dt_pid_per_mod(void *arg, const prmap_t *pmp, const char *obj)
>  	else
>  		pp->dpp_obj++;
>  
> +	/*
> +	 * If it is the special function "-", cut to dt_pid_per_sym() now.
> +	 */
> +	if (strcmp("-", pp->dpp_func) == 0)
> +		return dt_pid_per_sym(pp, &sym, pp->dpp_func);
> +
>  	/*
>  	 * If pp->dpp_func contains any globbing meta-characters, we need
>  	 * to iterate over the symbol table and compare each function name
>  	 * against the pattern.
>  	 */
>  	if (!strisglob(pp->dpp_func)) {
> -		/*
> -		 * If we fail to lookup the symbol, try interpreting the
> -		 * function as the special "-" function that indicates that the
> -		 * probe name should be interpreted as a absolute virtual
> -		 * address. If that fails and we were matching a specific
> -		 * function in a specific module, report the error, otherwise
> -		 * just fail silently in the hopes that some other object will
> -		 * contain the desired symbol.
> +		/* If we are matching a specific function in a specific module,
> +		 * report the error, otherwise just fail silently in the hopes
> +		 * that some other object will contain the desired symbol.
>  		 */
>  		if (dt_Pxlookup_by_name(dtp, pid, pp->dpp_lmid, obj,
>  					pp->dpp_func, &sym, NULL) != 0) {
> -			if (strcmp("-", pp->dpp_func) == 0) {
> -				sym.st_name = 0;
> -				sym.st_info =
> -				    GELF_ST_INFO(STB_LOCAL, STT_FUNC);
> -				sym.st_other = 0;
> -				sym.st_value = 0;
> -				sym.st_size = Pelf64(pp->dpp_pr) ? -1ULL : -1U;
> -			} else if (!strisglob(pp->dpp_mod)) {
> +			if (!strisglob(pp->dpp_mod)) {
>  				return dt_pid_error(
>  					dtp, pcb, dpr, D_PROC_FUNC,
>  					"failed to lookup '%s' in module '%s'",
> @@ -647,9 +679,10 @@ dt_pid_create_pid_probes_proc(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
>  	if (strcmp(pp.dpp_func, "-") == 0) {
>  		const prmap_t *aout, *pmp;
>  
> -		if (pdp->mod[0] == '\0') {
> -			pp.dpp_mod = pdp->mod;
> +		if (strcmp(pp.dpp_mod, "*") == 0) {
> +			/* Tolerate two glob cases:  "" and "*". */
>  			pdp->mod = "a.out";
> +			pp.dpp_mod = pdp->mod;
>  		} else if (strisglob(pp.dpp_mod) ||
>  		    (aout = dt_Pname_to_map(dtp, pid, "a.out")) == NULL ||
>  		    (pmp = dt_Pname_to_map(dtp, pid, pp.dpp_mod)) == NULL ||
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index 11d595898..e96479963 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2021, 2024, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2021, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   *
> @@ -55,7 +55,8 @@ static const char	prvname[] = "uprobe";
>  typedef struct dt_uprobe {
>  	dev_t		dev;
>  	ino_t		inum;
> -	char		*fn;
> +	char		*fn;		   /* object full file name */
> +	char		*func;		   /* function */
>  	uint64_t	off;
>  	int		flags;
>  	tp_probe_t	*tp;
> @@ -128,6 +129,7 @@ static void probe_destroy_underlying(dtrace_hdl_t *dtp, void *datap)
>  	dt_tp_destroy(dtp, tpp);
>  	free_probe_list(dtp, dt_list_next(&upp->probes));
>  	dt_free(dtp, upp->fn);
> +	dt_free(dtp, upp->func);
>  	dt_free(dtp, upp->args);
>  	dt_free(dtp, upp->argvbuf);
>  	dt_free(dtp, upp);
> @@ -333,9 +335,13 @@ ignore_clause(dtrace_hdl_t *dtp, int n, const dt_probe_t *uprp)
>  	 */
>  
>  	/* We know what function we're in.  It must match the probe description (unless "-"). */
> -	if (strcmp(pdp->fun, "-") != 0 &&
> -	    !dt_gmatch(uprp->desc->fun, pdp->fun))
> -		return 1;
> +	if (strcmp(pdp->fun, "-") != 0) {
> +		dt_uprobe_t	*upp = uprp->prv_data;
> +
> +		assert(upp->func);  // never a return probe
> +		if (!dt_gmatch(upp->func, pdp->fun))
> +			return 1;
> +	}
>  
>  	return 0;
>  }
> @@ -623,11 +629,11 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  	 *
>  	 * The probe description for non-return probes is:
>  	 *
> -	 *	uprobe:<dev>_<inode>:<func>:<offset>
> +	 *	uprobe:<dev>_<inode>::<offset>
>  	 *
>  	 * The probe description for return probes is:
>  	 *
> -	 *	uprobe:<dev>_<inode>:<func>:return
> +	 *	uprobe:<dev>_<inode>::return
>  	 */
>  	snprintf(mod, sizeof(mod), "%lx_%lx", psp->pps_dev, psp->pps_inum);
>  
> @@ -638,6 +644,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  	case DTPPT_IS_ENABLED:
>  	case DTPPT_ENTRY:
>  	case DTPPT_OFFSETS:
> +	case DTPPT_ABSOFFSETS:
>  	case DTPPT_USDT:
>  		snprintf(prb, sizeof(prb), "%lx", psp->pps_off);
>  		break;
> @@ -649,7 +656,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  	pd.id = DTRACE_IDNONE;
>  	pd.prv = prvname;
>  	pd.mod = mod;
> -	pd.fun = psp->pps_fun;
> +	pd.fun = "";
>  	pd.prb = prb;
>  
>  	dt_dprintf("Providing underlying probe %s:%s:%s:%s @ %lx\n", psp->pps_prv,
> @@ -672,6 +679,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  		upp->inum = psp->pps_inum;
>  		upp->off = psp->pps_off;
>  		upp->fn = strdup(psp->pps_fn);
> +		upp->func = NULL;
>  		upp->tp = dt_tp_alloc(dtp);
>  		if (upp->tp == NULL)
>  			goto fail;
> @@ -692,6 +700,17 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  		goto fail;
>  	}
>  
> +	/*
> +	 * The underlying probe should have the same function for all
> +	 * overlying probes unless it's a return probe.
> +	 */
> +	if (psp->pps_type != DTPPT_RETURN) {
> +		if (upp->func == NULL)
> +			upp->func = strdup(psp->pps_fun);
> +		else
> +			assert(strcmp(upp->func, psp->pps_fun) == 0);
> +	}
> +
>  	if (populate_args(dtp, psp, upp) < 0)
>  		goto fail;
>  
> @@ -735,7 +754,7 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
>  	pd.id = DTRACE_IDNONE;
>  	pd.prv = prv;
>  	pd.mod = psp->pps_mod;
> -	pd.fun = psp->pps_fun;
> +	pd.fun = (psp->pps_type == DTPPT_ABSOFFSETS) ? "-" : psp->pps_fun;
>  	pd.prb = prb;
>  
>  	/* Get (or create) the provider for the PID of the probe. */
> @@ -823,6 +842,7 @@ static int provide_pid_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp)
>  		strcpy(prb, "return");
>  		break;
>  	case DTPPT_OFFSETS:
> +	case DTPPT_ABSOFFSETS:
>  		snprintf(prb, sizeof(prb), "%lx", psp->pps_nameoff);
>  		break;
>  	default:
> diff --git a/test/unittest/pid/tst.dash.r b/test/unittest/pid/tst.dash.r
> new file mode 100644
> index 000000000..2e9ba477f
> --- /dev/null
> +++ b/test/unittest/pid/tst.dash.r
> @@ -0,0 +1 @@
> +success
> diff --git a/test/unittest/pid/tst.dash.sh b/test/unittest/pid/tst.dash.sh
> new file mode 100755
> index 000000000..f364e3e3c
> --- /dev/null
> +++ b/test/unittest/pid/tst.dash.sh
> @@ -0,0 +1,119 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +# @@timeout: 80
> +
> +dtrace=$1
> +
> +DIRNAME=$tmpdir/pid-dash.$$.$RANDOM
> +mkdir $DIRNAME
> +cd $DIRNAME
> +
> +# Make trigger program.
> +
> +cat << EOF > main.c
> +int foo0(int i) {
> +    int j, k;
> +
> +    j = i ^ 1; k = j ^ 1; i = k ^ 1;
> +    j = i ^ 1; k = j ^ 1; i = k ^ 1;
> +    j = i ^ 1; k = j ^ 1; i = k ^ 1;
> +
> +    return i;
> +}
> +int foo1(int i) {
> +    int j, k;
> +
> +    j = i ^ 1; k = j ^ 1; i = k ^ 1;
> +    j = i ^ 1; k = j ^ 1; i = k ^ 1;
> +    j = i ^ 1; k = j ^ 1; i = k ^ 1;
> +
> +    return i;
> +}
> +int foo2(int i) {
> +    int j, k;
> +
> +    j = i ^ 1; k = j ^ 1; i = k ^ 1;
> +    j = i ^ 1; k = j ^ 1; i = k ^ 1;
> +    j = i ^ 1; k = j ^ 1; i = k ^ 1;
> +
> +    return i;
> +}
> +int main(int c, char **v) {
> +    int i = 0;
> +
> +    i = foo0(i) ^ i;
> +    i = foo1(i) ^ i;
> +    i = foo2(i) ^ i;
> +
> +    return i;
> +}
> +EOF
> +
> +gcc main.c
> +if [ $? -ne 0 ]; then
> +	echo ERROR compile
> +	exit 1
> +fi
> +
> +# Loop over functions in the program.
> +
> +for func in foo0 foo1 foo2 main; do
> +	# For each function, get the absolute and relative
> +	# (to the function) address of some instruction in
> +	# the function.
> +	read ABS REL <<< `objdump -d a.out | awk '
> +	  # Look for the function.
> +	  /^[0-9a-f]* <'$func'>:$/ {
> +
> +	  # Get the first instruction and note the base address of the function.
> +	  getline; sub(":", ""); base = strtonum("0x"$1);
> +
> +	  # Get the next instruction.
> +	  getline;
> +
> +	  # Get the next instruction.  Note its PC.
> +	  getline; sub(":", ""); pc = strtonum("0x"$1);
> +
> +	  # Print the address, both absolute and relative.
> +	  printf("%x %x\n", pc, pc - base);
> +	  exit(0);
> +	  }'`
> +
> +	# Write the expected output to the compare file.
> +	echo got $ABS $func:$REL >> dtrace.exp
> +	echo got $ABS "-":$ABS   >> dtrace.exp
> +
> +	# Write the actual dtrace output to the output file.
> +	# Specify the pid probe with both relative and absolute
> +	# forms.
> +	for probe in $func:$REL "-:$ABS"; do
> +		$dtrace -c ./a.out -o dtrace.out -qn '
> +		    pid$target:a.out:'$probe'
> +		    { printf("got %x %s:%s", uregs[R_PC], probefunc,
> +							  probename); }'
> +		if [ $? -ne 0 ]; then
> +			echo ERROR: dtrace
> +			cat dtrace.out
> +			exit 1
> +		fi
> +	done
> +done
> +
> +# Check results.
> +
> +if ! diff -q dtrace.exp dtrace.out; then
> +	echo ERROR: 
> +	echo "==== expected"
> +	cat dtrace.exp
> +	echo "==== actual"
> +	cat dtrace.out
> +	exit 1
> +fi
> +
> +echo success
> +exit 0
> diff --git a/test/unittest/usdt/tst.pidprobes.sh b/test/unittest/usdt/tst.pidprobes.sh
> index 54444d49b..0c75d7967 100755
> --- a/test/unittest/usdt/tst.pidprobes.sh
> +++ b/test/unittest/usdt/tst.pidprobes.sh
> @@ -1,7 +1,7 @@
>  #!/bin/bash
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2024, 2025, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  #
> @@ -121,7 +121,13 @@ fi
>  pcs=`awk '{print strtonum("0x"$1)}' disasm_foo.txt`
>  pc0=`echo $pcs | awk '{print $1}'`
>  
> -# Run dtrace.
> +# Construct D script:  add a pid$pid::-:$absoff probe for each PC in foo.
> +
> +for pc in $pcs; do
> +	printf 'p*d$target::-:%x,\n' $pc >> pidprobes.d
> +done
> +
> +# Construct D script:  add a glob for all pid and USDT pyramid probes in foo.
>  
>  cat >> pidprobes.d <<'EOF'
>  p*d$target::foo:
> @@ -130,6 +136,8 @@ p*d$target::foo:
>  }
>  EOF
>  
> +# Construct D script:  add a glob for all USDT pyramid probes, dumping args.
> +
>  if [[ -n $usdt ]]; then
>  	echo 'pyramid$target::foo: {' >> pidprobes.d
>  
> @@ -141,9 +149,12 @@ if [[ -n $usdt ]]; then
>  	echo '}' >> pidprobes.d
>  fi
>  
> +# Run dtrace.
> +
>  $dtrace $dt_flags -q -c ./main -o dtrace.out -s pidprobes.d > main.out2
>  if [ $? -ne 0 ]; then
>  	echo "failed to run dtrace" >&2
> +	cat pidprobes.d
>  	cat main.out2
>  	cat dtrace.out
>  	exit 1
> @@ -286,14 +297,16 @@ fi
>  # - a blank line
>  # - pid entry
>  # - pid return
> -# - pid offset
> +# - pid offset (relative -- that is, pid$pid:main:foo:$reloff)
> +# - pid offset (absolute -- that is, pid$pid:main:-:$absoff)
>  # - two USDT probes (ignore is-enabled probes)
>  
>  echo > dtrace.out.expected
> -printf "$pid pid$pid:main:foo:entry %x\n" $pc0 >> dtrace.out.expected
> +printf "$pid pid$pid:main:foo:entry %x\n" $pc0   >> dtrace.out.expected
>  echo   "$pid pid$pid:main:foo:return $pc_return" >> dtrace.out.expected
>  for pc in $pcs; do
>  	printf "$pid pid$pid:main:foo:%x %x\n" $(($pc - $pc0)) $pc >> dtrace.out.expected
> +	printf "$pid pid$pid:main:-:%x %x\n"      $pc          $pc >> dtrace.out.expected
>  done
>  echo $usdt_pcs | awk '{printf("'$pid' pyramid'$pid':main:foo:entry %x\n", $1);}' >> dtrace.out.expected
>  echo $usdt_pcs | awk '{printf("'$pid' pyramid'$pid':main:foo:entry %x\n", $2);}' >> dtrace.out.expected
> -- 
> 2.43.5
> 
