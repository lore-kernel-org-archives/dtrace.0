Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38151FA4
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 00:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726273893; cv=fail; b=ItQndjrcxGkQpSWwWlc4MFrQwrWS1faVm4AjJEHZaA+BZknsdyv0ppwzgB7Mf9o3wOahmPi4ezRZxQu2zUm1WDQlw6Fz6IwwyB+cmDlW0P3+9JwuwL0V3VhU+pIxLDDU9+2RpuGrfx3LDkEdc4ElLzEbmI/mbGqgXb5st8Sss4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726273893; c=relaxed/simple;
	bh=0FmOcv+Fo9K0xITje+gqia5fsRauUo9nOn4S9xoarhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BD9LssrD7AgsMMcnfs/0hl5MCDL1WxfJt72hV5jLwT7YD6KOHdTqvsjl3P3Nd96uycJvXIlsAjFEiVIIaOfTbl/bHv9+lS2zjneJe8tJ3kW8X0qzMbJ1ZVK5LkUk4bHWG0R53/bbBtbo4wtKsvWw6hFUGQPPN/yJGb4OtBULbVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Vov/ZDWL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=q2c0Cz9V; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Vov/ZDWL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="q2c0Cz9V"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48DJ0bpE016801
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 00:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=B4axQNgUlzp7x78
	s10zgJv2e/UaqbK99QGQ2RNHUuyo=; b=Vov/ZDWLPygIlYNZ67o5VcuHdN3FiQ5
	tPCfSvB9+PscAje8BUtqSBMGYsZ7Adqm4nDAqKz54Glaxeg/WiUBEC3bSaxD+cwU
	SdCUvsebx286Z8Gdxhce9hfQYLXpreUICN5DchFc5g2eq5qmBPXx9ijFEu8UsqHa
	xlF0+nw9pobn4mNA5E77fq2gMZv4AmUuJjlZxUy+7b6OTvW8IMpZo75TYEJe8KXv
	EQ2U/y4/G8EzbmRzcU12OuXTnVz21kzs6WoEjbfeSbmf4lrXF0tGpfw0TvjZhGHe
	dpJPoJZ9bGiFjOcckIZ2brpbNl3cq4Wr8b1TDLgP1qkG/cLwFEEHJGA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41geq9xqe4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 00:31:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48DLdOVw019886
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 00:31:28 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2046.outbound.protection.outlook.com [104.47.70.46])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41gd9ktsjq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 00:31:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HDRmnRYvVEEqpgj/RR+TDn5IU3On4kEtJenzsqltQMt0qfy7jPeq6O6xzVN2qCMKWngE9tjK+3qp10wbSQehnjjElkAHGd5PvWFyr4aKpXXB14jZIt66i0pvOqTcgs6/elwNwl4R+QeoCX/IkKtiBhEHJVtanWkyUx5BNqpDUaZvdcajjSZ3Ui70lTkfGCPe/h1NO3EiGmwh/XzCdj0xVqFp+cIcpS7t/7Owgub89IIkWppsMIM704jq4YpFwOGINaKDtgBh3ohaJjYr/TVdhnyMo3RwI27+0O73RnNZ8ciRWELhmAODycofdVlMIptO79P1lrJ3BEiFQqQmk68mAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B4axQNgUlzp7x78s10zgJv2e/UaqbK99QGQ2RNHUuyo=;
 b=Inzrn4aTesTWre0MUwzwmdyKYnyixZyvMrhc5I9rd6VzZ4coP1cXVtf8O27dowgYUbXKnLNee2Cg8llWVuvS2d8SpJpP8u10xpndoaKXzzx8a2wU2qq/NNORVmXrU5Nh+0UBDViMOERRH7EkQU8TxuQHe0jeNOIBy7VDRy3FTUfkZH7WGhDwcR9BBi+X3ZDeKcsU2BYNGbXxiRvaImfjPAtH6rw7FuZ8/xE2TsvfwlZWc6jW3vY73KAtm+SZuFT47LPYrOQuPc8KpFou/XeChXT4JzWbvIBFZczooIK2+zkHhAOzLvtjx1PnN4n8MixtGw7Z1ryuKBO351uZpfhkcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B4axQNgUlzp7x78s10zgJv2e/UaqbK99QGQ2RNHUuyo=;
 b=q2c0Cz9VAhze0jGElyi3vvk9aq6gC4tt29ZUupfW5JBT4IsrdeH/LSdFarzk1V6gojPULXD5TcpTZ4bphJHBGx3Al5z0guptU6yKmejo0NrsDilwfkbfs8tdBwls8Fh8+bT+X4y7l+jfq1KAUfx/R7ivzhA2NWY5KO6ZQiXv9Fk=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH0PR10MB4581.namprd10.prod.outlook.com (2603:10b6:510:42::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Sat, 14 Sep
 2024 00:31:24 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.003; Sat, 14 Sep 2024
 00:31:18 +0000
Date: Fri, 13 Sep 2024 20:31:16 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 07/22] Supply a default probe_info()
Message-ID: <ZuTZVNrF2WAZpbrV@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
 <20240829052219.3234-7-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829052219.3234-7-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:208:36e::26) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH0PR10MB4581:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cf5815b-321c-49a5-a771-08dcd4548cbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r6cmQNQB30ap/QmzjM9aun6qMAH1EnIDQrmL3bdXQmk7A6GNBSKBac43QaCI?=
 =?us-ascii?Q?TAamUCSxNgainPjn76jQ9S3xGy0+41hYYCQW8QQ8eA+uTQU4RJe5xnCfzQ+5?=
 =?us-ascii?Q?sm+A+/ZvPp8EsXY95KXTGBwtZqU2SNdpqi3y9TfPLLM9elRo6s5iRwf+mCAk?=
 =?us-ascii?Q?i76CaXHfLtyrwe6go/okrqZico+etNVG+gxJmCDGgTOlb2DvDapwd/P264iV?=
 =?us-ascii?Q?GIQE94NpN/BIkL1PKa9RvQPrPWUUwAPZG/0sCT2kAr5xn8npY3/GV3WiJQ+r?=
 =?us-ascii?Q?2sS6YDoxj/Pn6+Gu2eRn5xsKVc9w/jdppVejWB3eNTMivTX8Qw0pzK/LKugM?=
 =?us-ascii?Q?LvF9Dst3AF7hVXsiPDT8rHNTTFQnL/28/vpz30Hdr8yxv/SPj6LVruDdPZYp?=
 =?us-ascii?Q?8fbtwFxkU5gvo/jBQiEQl4XfdFtfnhzvS50VR4K+PpseIYLkj6gYyJKE0qk3?=
 =?us-ascii?Q?xfEpkbf7thpYAS0ZNGGGNOvu7qgEq/LZtF2+pcy5W6JcQkWqyFAi7Xijl8Ne?=
 =?us-ascii?Q?lH3+5QxyQjpbIa+Aq2WjCx6lCblfezyrixHPPaEuWZBQVMiFsMlfDnfw6MIf?=
 =?us-ascii?Q?dgCd4eIELL7ksJM7Pvqt+dxnnHAt91q1THVzEM6OqjE+j7SdfnRpp7m/91zN?=
 =?us-ascii?Q?yocSQvfQaCmE0ZAb+GbzpOsLtPOXGHOkhPC3awHYOR1ujVNyCgUc2y9sOu+3?=
 =?us-ascii?Q?qLZxdteS6RpUiuJ2fhkUwwdcQTB6/U65UeaB9/heCK20gBMJX2o6zSx3amD0?=
 =?us-ascii?Q?UoQiIl+iwbkPsQGl9vwV1IX7KZC7QJVwtAEAJiFxCbmgsvsFWbNa9fr/4N7e?=
 =?us-ascii?Q?qAQfhmXA6tSHziJ1mGF5D7wJn4Chp+p5k/JUoBZcyZcG6fSUl9IafE1px/n5?=
 =?us-ascii?Q?dDgRE1AMU8OwQHUPvF5a+rgzCy11LkXD0Ch3wJrkpglA3yLB9LbSP2dFHWaZ?=
 =?us-ascii?Q?AdZdA874NB/uF6tIoH/vFgY2ybwxAvoQp3mvMvnhI44ADtYSzhtQOgqJ1FNo?=
 =?us-ascii?Q?zTEpqheJ1eUdFxK1ki9zu8KyrBKAk2yJTHsHbqidlXni4ZE/hCyiJjx6kvu8?=
 =?us-ascii?Q?Or2aarwB0OL21WNLBuI7URcFDbrbwQKM2r2JDV3d6vmaXNDPmvFbKBv8HuvM?=
 =?us-ascii?Q?leMijRk9ba3ySZSGxzX/scAX+dYCOBuU60ppS4Weo53Qz72hLUG3isSIsaqt?=
 =?us-ascii?Q?AmVDDGRMNLP55iEqWyIc78bsVAmJ0sbv5px78S6pfvmkEPAwOg8J0QH/Jwmh?=
 =?us-ascii?Q?fUXR/DLuAAqORMGF2RydcyT0lqLbuj3wrKMguYzHptZds/3xvg7Hv9PzjruL?=
 =?us-ascii?Q?Fgj4XekF+TPbx2BIQJnO2FkGjXmpjJ6dFRJ09aosIEzXKA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MpO+yQ79n3l3UincmrsYuUrRkkU7ndYsKW2wENkwZyk3D6NBtMxI+cIplyWq?=
 =?us-ascii?Q?uC8I64VRW6xkLNZi9mj7TuGpD5D2gAbSbX/QmzImcbM148oetyqK+I0pfpnn?=
 =?us-ascii?Q?oJ9iEdKUTK9M1Sf11+n1blCuK281RC7+TkVJTKrvMM3jJGtNa0lrYFBlMX0E?=
 =?us-ascii?Q?61WAl3yl9UBJilkfm+bsIixrVktl9queaYQ9WS66NhFpe5hMSTpDC+OXfxsf?=
 =?us-ascii?Q?hMq1jQ2ivOcPGlzL1Bby/UCLOWpLrsrAu44p+guRmwBET0vw5zpVtfyi0Yi9?=
 =?us-ascii?Q?nrIhxgLlHJRbUDJ4FqgOZ0C5iWaSj+a0wRO335VJXiRMULZV5A4bQkRp1XSC?=
 =?us-ascii?Q?DAPau+aBS7Q6QfR8px7mnIaCnyk4RoZv1Wol4JztCryf0CiqN5HfOGT0c794?=
 =?us-ascii?Q?etxMHYHYjwTERVqN9X2a/sulK28MLMqSdbXt1YzZ3SxOYKGlTh6cbYXKJ5a8?=
 =?us-ascii?Q?QWvxRLeo3sCQO2aWPJ4PweyRzJUEKWtoBW51C26yQc2075sWcQUOyHT/2Adt?=
 =?us-ascii?Q?EOKGSNPcSQqO+jxB7+O4iIRLL4N53xDpHRIsqY8KMxeIMNB70xr/DlZ/qcGJ?=
 =?us-ascii?Q?Qb1Rj/yVSWMBe4qdMpIR8kHAd0pY5u+KrodkNDi62eD/rwU+/QCOCP51TUQj?=
 =?us-ascii?Q?IQ+rpuXnFE2he1jY0ruBv8yiRWPdwFOSafief8kDScj2kD9FPdK+G/ShfxYC?=
 =?us-ascii?Q?fFPJQv9HH70bFCWvIEbfbEf1uGuIltE6Kb5NLtty1MlPJCr20XU3GPE8514o?=
 =?us-ascii?Q?SmY9kjYw6md3CeZGSzjQiTt1Vqx/3A2aR7Sov8gG/2VpCKAcrBTq+y7GErhZ?=
 =?us-ascii?Q?9ExIgv9PFh6GIMTBUO5s5A0OD8ULxiS2u9iqaFC8rirWyzURx/Jz4GHEXcq2?=
 =?us-ascii?Q?OIDF1iu52WGcUzsIJImNqc0+XhsYpw1kxL5TBqAm3Q/J0FsfbxyJqd0oAxh2?=
 =?us-ascii?Q?AYCJzmSfp90CJ/UPB2Y6HGrPV95vbBUcVF5dWzavLRj3OjCeFLVCZogprNXB?=
 =?us-ascii?Q?1tK6BKZlV6EgmygucitSPkSjfpgX6zhfgnHRbRia3E/VjbEquqT0dUBg7rQ4?=
 =?us-ascii?Q?oMUACC1Qe7G86IVye070thkuc7CZOVkA/3YLq2dgGFFOLWFLuMj8yMs716TU?=
 =?us-ascii?Q?Y/W2nONAfciRFV4nMASs8SoGN6F22epZ5A/KnA0Ecf8TUEYudM1MHl0PSnlH?=
 =?us-ascii?Q?cXInaiQ/oIpqXRXIC7mjMZ9NXq0pbQaVb23pHH+QwiDGrHqr849LtTfm1eA7?=
 =?us-ascii?Q?KYT0D904Jjm34fgHnzENJAmLj3HIvlUJIrNVYBEdD0eTgHh5UIzqmioRxgqK?=
 =?us-ascii?Q?UWWZ56jHv/L5Y9tLIHErXGGGsgB7Z/R6uDSb2xKkljowYfRF7HAT6cJJRD+S?=
 =?us-ascii?Q?UdKaACA86w/LJp+peDHBPH7GxOwU1R2F9569zybjs1YNUc1UiHHrJ3hKIKyx?=
 =?us-ascii?Q?yVprmTdZeyO5vsVUjB8qT+7762Xc/LJbhGxcae69I7IYno0ACznxiPL5GV47?=
 =?us-ascii?Q?p3Kvmfz5VdJhq2m5SWr1yxZWYVnst5mk4MkObdlf7tEeyNua654tCHfnfH3Y?=
 =?us-ascii?Q?mA3Yct1zifA5Smbwl9yDcP1PhFx+9AMiB5uSzo041gFHlHNMl+YJU9ROtCf/?=
 =?us-ascii?Q?xg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	y7NG7AQ2uXOSbC/auxs/hyI7xHOKXfXFxOx28t96fE049WBD3wXKckumGDa4xTZvb6PQ8wYUH/y5gmgPlOJDRinv2yyGkFQPJtkHz0DaB5v29udW/e9PlJPaxRMoY4TaEQlW4W7t4RWq7Gz21OOVABlDW+t2GhB9BH9HpYRt4lBtFnWosrRufWz2UJmxSX+FE6Dg+4itfUPXoR+qx3D8eCs67bRZDraGY/HVSXtw7UPN+04ZXeiVfrpk3qc13RoSxfm8YKjvjbJRA0szkkF8OjQ2+A0UQ11oTEiN21+y1R4KooYDmVIiYLYy743pM3Uld1x/qsR5lOcYXobJZBQC4BUZaLTnPyfSQMCM765A0ZLDmSZDpLZrNAqAnSzMJAl5/5W0I2g1pQ2T5DLuCSFMP017aDK9cCtRm/3jc1OzKqfpv6sKEL430SYXX+NxQi3O0oKQv5l/eBc1CbVHOpDoZUGV+78ego3A9RBaKkSPufPLCM8krjIRk/wR+WvNasDSzseoWUVnS29maTSye4vzkY1TlX4PO8NInwb+rFk8OelVYEF8N89SjInnTIra+BSlE201jhTsTX0+Dw3jVqK+fjzY9CycSosPru93Vfv3VxU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf5815b-321c-49a5-a771-08dcd4548cbf
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2024 00:31:18.4881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ukFRdT2zUJU0hoFGjnm+CfpdJDt/Zc/IqUOTNBZee1kIJIs3lvXbGht48U6kDBl1kyiidMwhDAQt+BvtWhEQn9Ijqi9STmWspuBm8FtIOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4581
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-13_12,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409140002
X-Proofpoint-ORIG-GUID: z3b4EjszYbSbGL2GtWu-qgfbipSWSLVL
X-Proofpoint-GUID: z3b4EjszYbSbGL2GtWu-qgfbipSWSLVL

Is this still needed after the fix we put in for dealing with argc == -1, i.e.
commit 0e3231a268 "ident: fix unsigned vs signed comparison" ?

On Thu, Aug 29, 2024 at 01:22:04AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_probe.c        |  4 +++-
>  libdtrace/dt_prov_cpc.c     | 11 -----------
>  libdtrace/dt_prov_dtrace.c  | 10 ----------
>  libdtrace/dt_prov_fbt.c     | 10 ----------
>  libdtrace/dt_prov_profile.c | 11 -----------
>  5 files changed, 3 insertions(+), 43 deletions(-)
> 
> diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
> index 0b53121a..ab90d2ed 100644
> --- a/libdtrace/dt_probe.c
> +++ b/libdtrace/dt_probe.c
> @@ -892,8 +892,10 @@ dt_probe_args_info(dtrace_hdl_t *dtp, dt_probe_t *prp)
>  	/* Only retrieve probe argument information once per probe. */
>  	if (prp->argc != -1)
>  		return 0;
> -	if (!prp->prov->impl->probe_info)
> +	if (!prp->prov->impl->probe_info) {
> +		prp->argc = 0;
>  		return 0;
> +	}
>  	rc = prp->prov->impl->probe_info(dtp, prp, &argc, &argv);
>  	if (rc == -1)
>  		return rc;
> diff --git a/libdtrace/dt_prov_cpc.c b/libdtrace/dt_prov_cpc.c
> index 08689b35..8f33cf58 100644
> --- a/libdtrace/dt_prov_cpc.c
> +++ b/libdtrace/dt_prov_cpc.c
> @@ -451,16 +451,6 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>  	return nattach > 0 ? 0 : -1;
>  }
>  
> -static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
> -		      int *argcp, dt_argdesc_t **argvp)
> -{
> -	/* cpc-provider probe arguments are not typed */
> -	*argcp = 0;
> -	*argvp = NULL;
> -
> -	return 0;
> -}
> -
>  static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
>  {
>  	cpc_probe_t	*datap = prp->prv_data;
> @@ -504,7 +494,6 @@ dt_provimpl_t	dt_cpc = {
>  	.load_prog	= &dt_bpf_prog_load,
>  	.trampoline	= &trampoline,
>  	.attach		= &attach,
> -	.probe_info	= &probe_info,
>  	.detach		= &detach,
>  	.probe_destroy	= &probe_destroy,
>  	.destroy	= &destroy,
> diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
> index bf87cb05..a9deccee 100644
> --- a/libdtrace/dt_prov_dtrace.c
> +++ b/libdtrace/dt_prov_dtrace.c
> @@ -273,15 +273,6 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>  	return dt_tp_probe_attach(dtp, prp, bpf_fd);
>  }
>  
> -static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
> -		      int *argcp, dt_argdesc_t **argvp)
> -{
> -	*argcp = 0;			/* no arguments */
> -	*argvp = NULL;
> -
> -	return 0;
> -}
> -
>  /*
>   * Try to clean up system resources that may have been allocated for this
>   * probe.
> @@ -317,7 +308,6 @@ dt_provimpl_t	dt_dtrace = {
>  	.trampoline	= &trampoline,
>  	.load_prog	= &dt_bpf_prog_load,
>  	.attach		= &attach,
> -	.probe_info	= &probe_info,
>  	.detach		= &detach,
>  	.probe_destroy	= &dt_tp_probe_destroy,
>  };
> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> index 62c568ce..21f63ddf 100644
> --- a/libdtrace/dt_prov_fbt.c
> +++ b/libdtrace/dt_prov_fbt.c
> @@ -411,15 +411,6 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>  	return dt_tp_probe_attach(dtp, prp, bpf_fd);
>  }
>  
> -static int kprobe_probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
> -			     int *argcp, dt_argdesc_t **argvp)
> -{
> -	*argcp = 0;			/* no arguments by default */
> -	*argvp = NULL;
> -
> -	return 0;
> -}
> -
>  /*
>   * Try to clean up system resources that may have been allocated for this
>   * probe.
> @@ -469,7 +460,6 @@ dt_provimpl_t	dt_fbt_kprobe = {
>  	.load_prog	= &dt_bpf_prog_load,
>  	.trampoline	= &kprobe_trampoline,
>  	.attach		= &kprobe_attach,
> -	.probe_info	= &kprobe_probe_info,
>  	.detach		= &kprobe_detach,
>  	.probe_destroy	= &dt_tp_probe_destroy,
>  };
> diff --git a/libdtrace/dt_prov_profile.c b/libdtrace/dt_prov_profile.c
> index bc224348..e1369ca9 100644
> --- a/libdtrace/dt_prov_profile.c
> +++ b/libdtrace/dt_prov_profile.c
> @@ -299,16 +299,6 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>  	return nattach > 0 ? 0 : -1;
>  }
>  
> -static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
> -		      int *argcp, dt_argdesc_t **argvp)
> -{
> -	/* profile-provider probe arguments are not typed */
> -	*argcp = 0;
> -	*argvp = NULL;
> -
> -	return 0;
> -}
> -
>  static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
>  {
>  	profile_probe_t	*pp = prp->prv_data;
> @@ -337,7 +327,6 @@ dt_provimpl_t	dt_profile = {
>  	.load_prog	= &dt_bpf_prog_load,
>  	.trampoline	= &trampoline,
>  	.attach		= &attach,
> -	.probe_info	= &probe_info,
>  	.detach		= &detach,
>  	.probe_destroy	= &probe_destroy,
>  };
> -- 
> 2.43.5
> 
