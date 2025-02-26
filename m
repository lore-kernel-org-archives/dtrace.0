Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B349A2904
	for <dtrace@lists.linux.dev>; Wed, 26 Feb 2025 16:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740589115; cv=fail; b=ZsWPt+Mm0UJEuEbJ+j8uqsqC02+7Z9ZnZ3Rx1une3dvCrrlkBHXl7t3u0c+D6GbLcBqC6UpyB99x8xgGDrKr3LB0SSzMCdMMEe0iGEPUGHs9UtQ7PRaWkP+Q7jfjMVyoTwHflysOh+iDawIrO3aQ/4VE7XNMyFZX/acSYx2bJWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740589115; c=relaxed/simple;
	bh=iODlyGPiHfMti9/NE5HpgVqTZQW/PkmroaeildOShCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ojx0DPsZjdqLUki7KafKYGe+Bd3QsOfHv6hCHqQIAjqeUBimx4NFvipf8PF1MJ/TwyRwn1qErjlS3r2NdZHAlYjYboLmDrZQpfmFolpwIK02jn278MdVB24o6UECUPFlNLhez5x54gNbnbeFhNMZO+EuO3jsN/XXZ3giiv+e4pE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Jxj0dayq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QLUpq5Gs; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Jxj0dayq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QLUpq5Gs"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QEtZ2h017009
	for <dtrace@lists.linux.dev>; Wed, 26 Feb 2025 16:58:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=StlYC1tyNrhhyXaTNZ
	A5zeFG3TMTxINvjZhYi5O9lJo=; b=Jxj0dayqQ1v/gcSNzmcS+HhNW4MLDi2F8y
	3OwqmXk1XBD1ozXOVMfQWRIehl38OIEcl8jNqCp+r6iEoZfTPkrgzrh8W2Dj3o6u
	7+rCNR79ihjr+5CiA4FO7gNj2PdgA6Mu/ul3DoiVL7b2UQlU1ia3QVb1N+cApZaj
	BlBWQP6r9Aov0CUBLyvZmQqXNQlrw1Fjd0VY2Ck3C60Jsln9v+rFK0qJIuJ7Vm8Y
	sd+sN84QFCDMWVtsfsW9oz5TByD3nRHThk0V538U4Hp+828584ZhWAE1WBKnDvSz
	gNU6yKaYdb8uHZJHofFnPvJ+uyvtvCSGz2lyKxWe0fxIC7K/+rSg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 451pse9k9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 26 Feb 2025 16:58:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51QGCxEM024463
	for <dtrace@lists.linux.dev>; Wed, 26 Feb 2025 16:58:31 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44y51aymga-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 26 Feb 2025 16:58:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EXgSyz80ZUd1gSPskhjMbVi5seUGGaTop0v2E/r5qd2XGIzz+xydsHv6D7WaDoZIJTxYuuQoOU4JRkvskyYOdfiVIs+pWEe2iCSZrXNq5YQMrvJr+dq/2Ht4pJ1+ZjzI88iXQr9cbUi56QLOBc0HEjmib7hHm4hOc21iF3Cvzr7IF9rbKWns5bAEHXcltYO6syh9P46uBzi4N+4IZ07P3oGRX+7y9GTyhXWKKfq+5B7j4rtQhW374zroFQ98qnQcfMywIZtqqbTf4yNKbmFIaRDLr6i7U4czLmpoUp7Ba5fb0NZdm1YXNK83TBsu5QBqV1yCJSAxUNYwJ8KVwexSUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=StlYC1tyNrhhyXaTNZA5zeFG3TMTxINvjZhYi5O9lJo=;
 b=jm4bIogJFinbJ4hpV2hUU9f9bQ5v40vT42qceEjHWuCB9UUjm+2d7pmrmRw06vWq1xmKZwn1IcnYVI8SxH500ZRUUmJ3m2KdhsjGcEnQhN4VGr2NaN8lqn+XH5iS7XGq6lCmzp+KheNv48TAsyfv/cOjmNCogskFuw9nWSCXSQQG5Kwiv+iMzQqzNfk+2SkyKdASNJLzxLG+q9QqEqKYpSLdtfylFdJqX7+r1pO0QPNwEP8rt3PrRsafPTM9xktBnv+Q0fg2YKGB/mtg01TLqY3toq7+U6KYKvuPj3f6GPM3bSdaRb3H448h8yovr+8AmHv9XFejYOyOkiJhUxaubg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=StlYC1tyNrhhyXaTNZA5zeFG3TMTxINvjZhYi5O9lJo=;
 b=QLUpq5Gsj30oIjGPIy+PxzturalIdCuMkKstf8LI+sUBADwDO1iKK62uqYwi9rBWvldfDSns0qgiXq8n8wkdBuWA0enVO6HXisLQPxzeizBfENaOkWSnwv1vtYj6P1mYo0+JVKDkE4NqvRvF/Slc4IJPaBYdnBLPWC9ba2d5MT0=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by DS7PR10MB7299.namprd10.prod.outlook.com (2603:10b6:8:ea::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.18; Wed, 26 Feb 2025 16:58:28 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%6]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 16:58:27 +0000
Date: Wed, 26 Feb 2025 11:58:25 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: Improve resilience of tests to ptr widths
Message-ID: <Z79IMWyCAyZPI8Gh@oracle.com>
References: <20250128213621.2617-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128213621.2617-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:208:36e::28) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|DS7PR10MB7299:EE_
X-MS-Office365-Filtering-Correlation-Id: e398a1f4-c319-453e-0d5c-08dd5686ca48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ye2ek0yOf4KrovTVBXINwaML861vHqT92IKMUfNHrPHjwUYlRB0JkLmooZsR?=
 =?us-ascii?Q?KNxE9gKBxYxRLC9riKb/fXL5odCz2NR3UKZVRzus/Pyl4EWPWulAHDExrud6?=
 =?us-ascii?Q?Pza5C+NHC4TMnjCXE7Us2dEZSm177HUlBuKqx7P0Vb/FIw/ZNpzU9M6crASL?=
 =?us-ascii?Q?LUWpnxqtAkpIHRBWwMdJwG5UXOnjJ3uJ7ZlzpLTPvA1qOLgg3bVTKnAT81Lg?=
 =?us-ascii?Q?9xi18bgqJxBzBFPlTpwpYIntCQl1+PurNdc2SQ9ehiCmfEYyhIpDqFiQHee1?=
 =?us-ascii?Q?LFH6C13DVJsqGAmeGg8yO8xRqMqhQHLmG7g9LoL3NIyWHBPpu4QS80TEIEDP?=
 =?us-ascii?Q?tAsTieahrJDmrU1MfHH2xygv/aI5Qt5lbqvCJIRdR3s8ppfvV8oU4saOVTCG?=
 =?us-ascii?Q?q2DYOCJuT4JgcTAyHU4rcdhkEdFMf5zCrMat+YlGIiUS/2KMoyaERyqxrbGC?=
 =?us-ascii?Q?bbuoN7UMo/SKxAR8tdjgSTGxkViSF4j8YEiP3L0mD5WLdvs2USZSF/Af4eff?=
 =?us-ascii?Q?00lVf/Hw7UgNfi4MTn/MjaT+MHP0h1YFxr7zfyJ2QP6QWiAFjMervcp/5H9B?=
 =?us-ascii?Q?UbFX+YhZlPt87qBDYThTnToQ+nKYJNSIsb3CiT79HCN02CH7MQGrfo05B9Ke?=
 =?us-ascii?Q?QPj02JWjWPfUeuBGebG6o2UrLs9/Nmazr7QxRGy4XpUXl0t5W8Ta1a7KLKsN?=
 =?us-ascii?Q?zIs7zzED1wC2clpTeibtZt8Js68ddEMbENShbdEZFaJ8YN1cai3UbJabTXvL?=
 =?us-ascii?Q?aegde+4RHHTKTsN2lw/EXjzDDd43l+slwpNrcmKIdnJeKOEKqJK+4+QuZkyg?=
 =?us-ascii?Q?ejcHO7qwK1g+qagjBHlOlgIFfzC8sW0zac0ONt2X4kh5K23wBbCWBnWFv8yo?=
 =?us-ascii?Q?ajoYTDfoboYdGyTQJCHrqni4E9NGFAqgF3TEs5F9V2oIuRc0xYzwfyahdI5f?=
 =?us-ascii?Q?DVBlaIfiBbfeqzaJ4+q9GBWjpAapcG3rtaTeoioVvD3id1KoKS1cQbUneC3Z?=
 =?us-ascii?Q?+YppffgXngOiTgqtMVNwfn5ikCbO+ntyVYLpXgFDjoZxq4ZBAc7O6fwGMLsK?=
 =?us-ascii?Q?t5dVWnh4NSsvqICUze9UNyw+Xi3q7gkiNb+aUCp5w+Xb46XPO/apdJZvTCKo?=
 =?us-ascii?Q?zWMS7lxXBssY5SR4t7UkDqbt/IpPJMx02Y129ZhhOJMu1M9RLgyArKY/MRbT?=
 =?us-ascii?Q?jGftuNEkcDydeW0+I/KDlHHPr/6N0cIGi4znqxx4sa8d88OB7dHWi6eYpfI8?=
 =?us-ascii?Q?5vR9B/u5v1Xpv6pVBmR/BJVmGUTpmqQQYfqeIgbEHONrAgd3/sQ9d0ZaqqLS?=
 =?us-ascii?Q?LTJnlPs7T2e0ynMrG5bg7dS8Qm9m9Bnvpeg4K5bBnzZvae0X5nKkrPeK9tLZ?=
 =?us-ascii?Q?F4Pt2iwzDWQ9P4oNvwchhXj+s7bj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KovKPv2pCziBQswhHxYowM6rkmAOZKZZTV0y+r1KTiixvMCES+MjVOWOT7a3?=
 =?us-ascii?Q?7ntgpGGF808tCB9r6JZwTnRtOC8p1xeKsge0Gn4S87bXK1z/QTvPZBTu8Mu5?=
 =?us-ascii?Q?xvkc8Kzd06XvX3UWa2Z340X+ScyiN5pUHAiWGXGREZ64YRzgOA8t6s6Soo8k?=
 =?us-ascii?Q?rpaWkxekFEDmFKG2y+sR+PP+Hfuo4PlEd19n9lg0vqQ+TV9h5FBTEqVucXJS?=
 =?us-ascii?Q?3RS3CQBLDUZ2JOuz2rBdjk1eKYaxrZ8BBrLNpLFjdLBNNLBwgpyYUKfpvyvo?=
 =?us-ascii?Q?HC0bEeVimp5r2/ar8H0L7w/n4PKsXQlM1lbmGTLulMo+yaXvGYr+5wVlQoAV?=
 =?us-ascii?Q?t5ua/4VQDOkI61mYRl9OncKnr8m7hUKwKXLA+Ns8ibD41xeGxWZSZy4HL/aw?=
 =?us-ascii?Q?mPnWApLhBPt1ftS1c00xynqj45vKb7OQTsm9uEgf2TW195n8TBqNrcUqsH78?=
 =?us-ascii?Q?sDPteit4frKnf1qgIcf9Oc1qB8YWzneRG9GjRODUnc1LVwMVuWAS1UpUal1j?=
 =?us-ascii?Q?OfD5AHAaC9GQ5IVZV3nwBg7Y5UQpGsOM9bynrrQqzQDL9ZTSCrqU9RZl7Fp+?=
 =?us-ascii?Q?3Tn/xcvMS8hHlYkSIiAtRlogGMd0aoDd2YGAaVLha3MhKP+iNu2/1cqBGweU?=
 =?us-ascii?Q?/CuuR3RBDaW2tBlmE3GcAiwjoGUtb+0EICqJhrPM2dyx3dc8JSd7Gm/GCWEW?=
 =?us-ascii?Q?lBSN2HOuulv9KWkT9RJJb2r5uBlNWlcBMP3RatohkNH2bmOpu8KYmX1uOy0b?=
 =?us-ascii?Q?V1L5bTfKxlSfT5Zjhcpu9jH+i39w3zSr+WY+G2wGuCjfV/D7AdTG2EPl37Fe?=
 =?us-ascii?Q?C4m7F0mUf+Lg0DHgEcc63ttTLRfCwkbAmYAqDtpH5AUE3rTq9eG+1GIGtNBH?=
 =?us-ascii?Q?BOZ4qeWKxqxsBRSReJVZ3UmarHzBTgfnPkuC1y9klj9mNF6s7ceDqTndc/4Q?=
 =?us-ascii?Q?IAZ3l8+sNT/1QjoeSWWOAMLn77kW6vd3aAo6c84Gz9txkl2pu+kgKyFNV6Ua?=
 =?us-ascii?Q?u1BACj5bOonIF60Ewl0barwi6/iXZuiJhFjnznWCQnuV8slS4jmsufXOEpmB?=
 =?us-ascii?Q?FCN4+jfilzvJ6ZiTd/upyBpmNAVrhbrBGYezTFIrFaqvoM8bGWjgHRDBf44f?=
 =?us-ascii?Q?PeZWFqRjL/4lbrlwXAYcKXOMHysb54Vna0Tw8B7Rglua2cIoBKKXARjIGzmJ?=
 =?us-ascii?Q?R70NPJSx9BrDjm+1pxAjVooW+XuKukvx1DiFiwpTswk1gUTBmF3VWIBEpIhr?=
 =?us-ascii?Q?DoRS0nbMpbTPxXCXKTgMQDacFjWYXo8geWxw5hQhCfsv9MG1RPw6pM7OrNcx?=
 =?us-ascii?Q?oE3wS/M6iJfROmwlj3agSoqfy357EYq9bLIc9FwO3GIvmub/KqNxojVjptwD?=
 =?us-ascii?Q?WaiDm3hQW7nXXBttXNZ/nES5WbgJXI4KqbDt1jpnL9elYiDDHAW7eOnwHvib?=
 =?us-ascii?Q?bKgbB4KABHQ+1xtLZjWtguzl7Ccn7jIZ+iRjQPG/k6szzI6XnWho/S00f5w8?=
 =?us-ascii?Q?M9vB4udI7+TphXPvpkMugqFj3gX+MXNcdRsHrVY95nE+DGvgOOeCm/2Ltfji?=
 =?us-ascii?Q?n55Q36pDphrGw7m+lMo/77wusJRX9MhZIwjmDyK7kKZMPxOZOloTptre8r8k?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hYKgv6QKfbN0E/Zm5raUrH/dNpGdoGNLUnrCCq2oEWC87K+HhZNKStdfM/UVLEXcJ++45tNWaEBgax4s643IhKjv7QauVq0lBfp61ah8MTSGBHe8+i6cZOK7mNyA+AXh8kOt+11vdGplncGFbr7CUjvB3Yy+QAEz1JeZbR9XcScYxAuS+x7qkjJdYSLBwesEwhroPXrpQEhj5zp+fg6mbRX7sGS7XXL5yRXaQyNqi/FiD0DOCoxh+lw/I/NXbpF4TLJg/fl+GtymV/yaRFHHehOdxm/efqa3hbn28BQM3A6hJ5YOhEhUS7DoEzU/wvVQRrby3ChVRKTH7CExy+l+TUtSv2l/X+uICJ/y+T8jJFwmj3KW/2xAQ6dWsDaJhtfb53bh8GVDElJHL5Ir7t5UVcpBR5UgsN10dkzwO5DFQDWU+F/2kEL4wh7bJy4tPninKxnYKJu1zRXgpCqigOctg8dph16+Tl+Hp9WZel8ww7QG8OkLAa2RkW7TUrHM0hdEZQQywknY7SqepH0fnJQsUmgk3fMhgle7LK3o2u+xtJN+LHWGBbh6qwFm6Lmk56cq74tr+nYdev0Lp3qHyLEu2+v09vYZzE+m7hTnUxDigGs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e398a1f4-c319-453e-0d5c-08dd5686ca48
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 16:58:27.8685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 76WSh91qfn4klWpoJhP/ov1Y8pCXBge3zBzdN240tNpEx6pYOBs86b+05uJKsCH4FdV5JBFh/VvPt0hZkNWbPwlwgAZmOHREUPGB/UPBmR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7299
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_04,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 mlxlogscore=970 bulkscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502100000 definitions=main-2502260134
X-Proofpoint-GUID: 7dlDrt_M4vVtjUcSDcieAJDdklx30LYm
X-Proofpoint-ORIG-GUID: 7dlDrt_M4vVtjUcSDcieAJDdklx30LYm

On Tue, Jan 28, 2025 at 04:36:21PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> When tests are run, runtest.sh runs postprocess(), which among
> other things turns irreproducible hex strings (presumably offsets
> and pointers) into fixed strings (like "ptr") for correctness
> checking.  In a few cases, however, there are trailing blanks
> to justify the right margin, meaning that the width of the hex
> string can cause the number of trailing blanks to vary.
> 
> Improve the resilience of these tests by stripping out such
> trailing blanks.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/ustack/tst.uaddr-pid0.r   | 2 +-
>  test/unittest/ustack/tst.uaddr-pid0.r.p | 4 ++++
>  test/unittest/ustack/tst.uaddr.r        | 2 +-
>  test/unittest/ustack/tst.uaddr.r.p      | 4 ++++
>  test/unittest/ustack/tst.ufunc-pid0.r   | 2 +-
>  test/unittest/ustack/tst.ufunc-pid0.r.p | 4 ++++
>  test/unittest/ustack/tst.usym-pid0.r    | 2 +-
>  test/unittest/ustack/tst.usym-pid0.r.p  | 4 ++++
>  8 files changed, 20 insertions(+), 4 deletions(-)
>  create mode 100755 test/unittest/ustack/tst.uaddr-pid0.r.p
>  create mode 100755 test/unittest/ustack/tst.uaddr.r.p
>  create mode 100755 test/unittest/ustack/tst.ufunc-pid0.r.p
>  create mode 100755 test/unittest/ustack/tst.usym-pid0.r.p
> 
> diff --git a/test/unittest/ustack/tst.uaddr-pid0.r b/test/unittest/ustack/tst.uaddr-pid0.r
> index a8e68f4e6..cc1cdbc3d 100644
> --- a/test/unittest/ustack/tst.uaddr-pid0.r
> +++ b/test/unittest/ustack/tst.uaddr-pid0.r
> @@ -1 +1 @@
> -  {ptr}                                               
> +  {ptr}
> diff --git a/test/unittest/ustack/tst.uaddr-pid0.r.p b/test/unittest/ustack/tst.uaddr-pid0.r.p
> new file mode 100755
> index 000000000..9203dc824
> --- /dev/null
> +++ b/test/unittest/ustack/tst.uaddr-pid0.r.p
> @@ -0,0 +1,4 @@
> +#!/usr/bin/gawk -f
> +
> +# remove trailing blanks
> +{ sub(" *$", ""); print }
> diff --git a/test/unittest/ustack/tst.uaddr.r b/test/unittest/ustack/tst.uaddr.r
> index be48a12ab..cc329e213 100644
> --- a/test/unittest/ustack/tst.uaddr.r
> +++ b/test/unittest/ustack/tst.uaddr.r
> @@ -1 +1 @@
> -  ustack-tst-basic`myfunc_y+{ptr}                     
> +  ustack-tst-basic`myfunc_y+{ptr}
> diff --git a/test/unittest/ustack/tst.uaddr.r.p b/test/unittest/ustack/tst.uaddr.r.p
> new file mode 100755
> index 000000000..9203dc824
> --- /dev/null
> +++ b/test/unittest/ustack/tst.uaddr.r.p
> @@ -0,0 +1,4 @@
> +#!/usr/bin/gawk -f
> +
> +# remove trailing blanks
> +{ sub(" *$", ""); print }
> diff --git a/test/unittest/ustack/tst.ufunc-pid0.r b/test/unittest/ustack/tst.ufunc-pid0.r
> index a8e68f4e6..cc1cdbc3d 100644
> --- a/test/unittest/ustack/tst.ufunc-pid0.r
> +++ b/test/unittest/ustack/tst.ufunc-pid0.r
> @@ -1 +1 @@
> -  {ptr}                                               
> +  {ptr}
> diff --git a/test/unittest/ustack/tst.ufunc-pid0.r.p b/test/unittest/ustack/tst.ufunc-pid0.r.p
> new file mode 100755
> index 000000000..9203dc824
> --- /dev/null
> +++ b/test/unittest/ustack/tst.ufunc-pid0.r.p
> @@ -0,0 +1,4 @@
> +#!/usr/bin/gawk -f
> +
> +# remove trailing blanks
> +{ sub(" *$", ""); print }
> diff --git a/test/unittest/ustack/tst.usym-pid0.r b/test/unittest/ustack/tst.usym-pid0.r
> index a8e68f4e6..cc1cdbc3d 100644
> --- a/test/unittest/ustack/tst.usym-pid0.r
> +++ b/test/unittest/ustack/tst.usym-pid0.r
> @@ -1 +1 @@
> -  {ptr}                                               
> +  {ptr}
> diff --git a/test/unittest/ustack/tst.usym-pid0.r.p b/test/unittest/ustack/tst.usym-pid0.r.p
> new file mode 100755
> index 000000000..9203dc824
> --- /dev/null
> +++ b/test/unittest/ustack/tst.usym-pid0.r.p
> @@ -0,0 +1,4 @@
> +#!/usr/bin/gawk -f
> +
> +# remove trailing blanks
> +{ sub(" *$", ""); print }
> -- 
> 2.43.5
> 
