Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34749361DAB
	for <dtrace@lists.linux.dev>; Wed,  4 Mar 2026 20:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772656295; cv=fail; b=hbQK3ofe1tlEVGHs5dghSXNlJ6Jo3ZZtsM3uDdmA6jFHD4yIegA4XyyFtIlMCLLO0vgGy0vjG7uBKElUwSgZTmWXyIG+f6ywNV/qT32tGsEXoDkcutn/od4lrsOltUx/kVITAluYbwDu7pX7pDP96A1OmTvjAlsuvicmxWlPFao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772656295; c=relaxed/simple;
	bh=IawSLDdywb1IfS3Bv0cz252P4wMUZt5Q3uTsEXZ0lOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HbB47V4MSf9jh6vWgqrFmvu+zlD5LSpTme4UtokT7iYNn+8io5DUqiI/oTL/BcqH2yFdkceDy9wIyyQxjw0kJsKXpbGa7Ei0f01QfiJtMy9V9YNjR/ti90F5vOMWy0ZrAo9r7rHmDficAUH8TWHK5pWdtdHV8RcYpbxlGDAm4UY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GiY6PhN2; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Hf3t9ajH reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GiY6PhN2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Hf3t9ajH"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624KNRnb3320057
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 20:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=pIhWFaTWoreBkczZabOXyxGf5tz8PIWdETMfMrN6G3w=; b=
	GiY6PhN2O/a/b8O4e5cp2qeDxaxdRqtAgCYoIRllmHLZSwwGH63GVs8Uun9KsDee
	YObApup8JSMJxcIPg9CjXZf4D2p9LKoTS0yPExK5iJ73EbPrXM1cQLEqsnuWjcMk
	fcVyFIajPqcDBARNF8oqCIH2bpqjjD5csNzDaRvN1ZG+4qAOEJYsYvDLhidBdUL/
	qgjgOU8k3S8NJKY69KsJQb+jfv4x45m0Vk5A1vkl5r7DZv4OUfiCoOUSCHfw9o/c
	N4ozH9NN3jUS0OCnh9enN4KoPJ8TAhRev4y9tKza3kudwuPjGsk4DNdmkA3Nywh4
	yh4VVaylv4EfGfrGBeDywg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cpuqsg0m8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 20:31:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 624Jlod2029986
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 20:31:32 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013010.outbound.protection.outlook.com [40.93.201.10])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ckptc9nm7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 20:31:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aY0o7+wsWexgm+TwAObGEfKNMQvx8QWdUVJQqomHKr+IASUEzWtBWkjt75te1Z6EKVsOxOV1uVeLqMPj4KiDscxRyUTYdGfew9tJwkpWVvCJaon88SEjMjc+JEMmjeLfLQB8NMgrlsf8ru011ccxjpdMQ/nO4PXGRLZvkA9KxA7R/wxjXbOSaceLB7pMXPcm5XNgR7cYUE8zVGxdpp7ukAyNyVuWaaCcdOSSjNczA8GSNUYVz/fzx0uuXhcDBortE3e/LWxRGmuXUEFSi9XYYffUJpa6xyiDW3hDP1pNwgExAPiDzncsAhd8g4bNfQJffp1zKqeHu7fwn7jbeObYcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TB705+awl4Y71lQuhIUekomf5iEhg/vWFa8ihvAqasA=;
 b=hmbMp5pGCnasqE35+kE2/Df9wpZpMuoth9ZQBemP4rSIw/u2KCarxOntSfmkuyRSQK/6Y4OxuEXX+A/yy9G6SDeVcadycNWAIbItJMceCZjoDsUxc0293juQemggZ07aHeE9+M27kns/4E0UeaMppMFOd29Y7fb8NssHwi7wCZ0UvNJ9V9pjU274p+AksRMfBTsHA/bqageHYWHPGERfxOH3sXZOcAWYM2xV76Afn5ab1OU0EYoYWkLMOq5a5Rbgw1u58KdVp8Ey/jlO42bBeVAEoxkElKnAVM4XXLKDwyHPqplbPWXYJCe6qQQvtfR8Oc58KkupHEbrdx94R3KZQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TB705+awl4Y71lQuhIUekomf5iEhg/vWFa8ihvAqasA=;
 b=Hf3t9ajHFt11bxRo7Kop3+JHT4vWJxlVRunGCEvduqXF3269pEMcPHAEp5xHEuBZXMxeEVERDmX/rn0Z8L9pekK/2PnVwA52DSITKK8Z4Ttj0SzwiZW2OB+qBalTzKXcBNWDZo3Dlrcxvdjq2MNU7n4gR477dGdCewJUk4PQ9d4=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by DS7PR10MB5053.namprd10.prod.outlook.com (2603:10b6:5:3a4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 20:31:29 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 20:31:28 +0000
Date: Wed, 4 Mar 2026 15:31:26 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] sparc: remove architecture support
Message-ID: <aaiWnln3uGmlCu6G@oracle.com>
References: <DS0PR10MB752292F0685B382085838FB8C27CA@DS0PR10MB7522.namprd10.prod.outlook.com>
 <483a8ddf-bc12-d7e5-f7f4-24aff9fcd874@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <483a8ddf-bc12-d7e5-f7f4-24aff9fcd874@oracle.com>
X-ClientProxiedBy: BLAPR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:208:36e::29) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|DS7PR10MB5053:EE_
X-MS-Office365-Filtering-Correlation-Id: 20acdfab-9ea6-4e34-b8d6-08de7a2d036e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	Do7scgk2vk1ayKbN3Y+RHDrDMbv0bztLAVz4YdCHRQyb1Sec+yvbbNUMILWLBYnFNBG+F2iu9wPZIfeNvDoCY8emkxDKt08yzWzZH0RosMP/FKyb4UgqlnN9kBwZSht6zw09LtDJnTg0xSH9kEdZWEkMFB1azVRdaca41sU50FBo1TxaLzgWiRn+CZTlAvPpBIeGuxou8l0aVUD/3POQGUEqSr6sAaz2uSeJvNwZGZ9ZEuTTNqRwtwpO7xcBVZsd3o0bTAiIaYo9p7UXoAwro6lA3dBDEZl92XixAZx+70yzpsZvLuytYZ3bKPecAc6HH3WmlAVqjIntqpZM3MvfS95ea/FMiSJvGPvSc5BjxI0PpjD1FM8gOcf+NunSyShDfj6cwWMbLKtnNMf3Kgiyji7r3CsLLotNYQ6smk2BlQPbeVYiEvKJ8oKWE38E+eGMbhi90lserP0grXJU6b6Wz65NJ98cWMeTxkzkmZqF9QsWWuo3jPnIFS3iCV7VeJN9UevuEufHFxrCo3xD4BbGc2JSoE9337li8q4F/M6eIQmPE2jNU5wxItj+rk63zquqdjm2DV6CsFFFGw3eqPeJfmwHX9zdBYmeXxhwWJVQoioZb2nC9SQoUSXuTPdFckOa4LrgbaLUpCkqmJE8IGwkYSX1Yalaanwc0RVoebggPW0oQYN7OUToM9RMbXlwwMOyqeKdLL55IE5Tyf0aqEBSR0Fc6OMdxqV6xjjDlXCPQKw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?sdMJWNV56Z8I+JTlR3rs/dbF0B9zDAPbBhtjazyyqXKnnbjxSyOoY/HYG8?=
 =?iso-8859-1?Q?1OcSTG3Pbrw0jbdpBwKiawPkUFQbdP7KE9ZoYzskVspL+fndTylvdyIEDs?=
 =?iso-8859-1?Q?NQ8J/alFMWJjBDG7H5M8T1wJXfJT33iCAPEx0MIhOsN4oS56TZMFsQqJAc?=
 =?iso-8859-1?Q?/tsDO2xRzYJngSka9V5yksREPWRwhfPhD9YtiLFCk3xZj3oaxyJnEEwTYU?=
 =?iso-8859-1?Q?wutGu18pv1SAV7ztKSL0SY4jyzw+kYW0TUUQDanrIyIwd444hSy4Tuue3L?=
 =?iso-8859-1?Q?pzgti4EgzYo1EJxwPH5YOO/QOuq0rKZ9Nz00dljjN4Zx5T/n0lOYE8eyqE?=
 =?iso-8859-1?Q?bUCeQzCaOGN3wekNOdUz97UQ1ygZS3rZHP2r45dHAmDjZgYAEw86iJAeIF?=
 =?iso-8859-1?Q?NlWrzZmfOhjXXBv56bAZx4Z22G9QwdUCZ8oQ12UXM/eHxmNBUYmaHJG7UA?=
 =?iso-8859-1?Q?1KILWwOCVzqZ2dP6mNVsi2LMaR+tJuBITLeffz17luipM6YYGs4v0KA+rT?=
 =?iso-8859-1?Q?Gk/qVRLTe4Bx2uJmb4iYYcvrJTXhgrektzDifRezAPnOQ8bbXP2HTuPsWx?=
 =?iso-8859-1?Q?yL418VI+1e2rJkjIzajnoRb+lWFa6kwpI+s+MttDWyyvWiQ4Yx74DcvYe4?=
 =?iso-8859-1?Q?XDrmtj4G8B9tmA3QKR3rwNPzhF0vf3M3X4WIK9ybQ6c5mJv9k1MrVHSmkc?=
 =?iso-8859-1?Q?S6wlVVLPG4qYypdE+xzv008hkSBimTModCrNflE3rdqy2FvuFRV/moWS5T?=
 =?iso-8859-1?Q?gboXyXKXvAULWc2lp12GlGdf9aMQAdnjmAGYD2KSn0NiISMs+etnzYkb+W?=
 =?iso-8859-1?Q?uddwTqlET3E7lmRcnkqfjrk3DQBq8HxzfQWfOhjzt5entmJ2MvM/e5zSwf?=
 =?iso-8859-1?Q?lL5vwZ/QcDioXvFYCWF3u48Y1zo7K8MpLMCoOy06vL9G/zMq515YOMBZNU?=
 =?iso-8859-1?Q?7PRmId4rSAUGfe21p1JebfhT0KM3LlPoJ5e0qOGty20e0FzaMGHmph9HTH?=
 =?iso-8859-1?Q?cOAV/cGGnmSTEu2RaT3UxpO89joXDp6mR8Dsb1oX/HwQCM1s+0l9cqcGtC?=
 =?iso-8859-1?Q?TnfWj1pnoeU2bMTgFKVtXEOdqR6Po9K+0GstHt38js/L/txbmegh3odPhO?=
 =?iso-8859-1?Q?paqMEGSOh1lbYKsu8pk9AprMntxI6vA1WEiGSjXEnjQytVheTpcryFknRV?=
 =?iso-8859-1?Q?qwYA+28tLZ9m/XlHdV+P/QoAM7yFKSnHVhuZ87tqd6WZjbh/oEQROa9iKU?=
 =?iso-8859-1?Q?4efXMOf11XhYfDhTtkKs45W+Y/O5OKUFl+dr1epXzPT5z1NgKaMMcEYXH2?=
 =?iso-8859-1?Q?P9jWgR5MyqH3d//auL7cTdQ/iVKL1ityh+bGE9t4pnGMEBJhyqequLYKj0?=
 =?iso-8859-1?Q?OXX7fJQnrfZx/4/rjXjyBlnEWx/Fwhy/CbjhQr+Qz9lE4zxFDiYxgmCS2a?=
 =?iso-8859-1?Q?ZO1f9L4i8HkWV7CGbErqq9LlChjSFw77dS1ilxMsp/BHJH3FrLysH0Ka0J?=
 =?iso-8859-1?Q?1Bg06Vcso3TyQhjG4SmpzZicDQewtKJ394oHSgf5KKyTdBVITvywLiHEK0?=
 =?iso-8859-1?Q?lXNA/WpwQnMuvOwT0ZJ1RAUeoopkVEPe69F6DKQLzeuyR4aVKTXoiT1Ka0?=
 =?iso-8859-1?Q?Lh6Aqxe9k1CUNU6DQSoUKjQPUdvnA4zJ05XjPKdrl/EZ5E3zAjQt3UPhpi?=
 =?iso-8859-1?Q?pLRPXloMXE9o3MEvcV9c1SGLiwC5+Qsr6Z/IcS+Acy9mWAY857x3CO56k4?=
 =?iso-8859-1?Q?Dlp+0vdMuJYUycI7FSdNpbaoPoxNr369q6AwgH0KY73FX9xmjBXsh/iXDG?=
 =?iso-8859-1?Q?6FgoHAvtWg=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	XkuFlgp0T3kLl/nrZxQYz9+TM8ynf9Tkct5q8D+dg5e+gjSRQ6hx8DqrBPjIcit6GAvKltyniw9ipVicLAGgwD4KU0NUjlLvYJo+rwKV/z/4hXtSAYgWbwFHyhd7nuEV42C2pzxJyuHYDtJjxV7fiPGSnBZLoAoB8Gao3h17JI3bc9Hcic5+R96VLdQLcuGvMXmAPaye6SyAUA9jt8iC4nVY/6xyL4fnc9sVfbFkQ3a0T9h7OmUEccZ/KoMYKdhxukAFaTWbGee5mQfM5x8rS/f9gfyE7Xj9wOrI83RvYZdLfly7DKhQNfSspcFg0XP8LczyIJHE9PBShv0wi/6ANw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iwuYBa/D4zX4GMksJPuIuuukbNHaiHfx5RpxVucFi6wL7w2jZ/pFihl18a15CJbOtcznX76B+9bXYJL8Xt5V6irzHFi2nhV2qe+wSu+Ojf7KG/gQ58LCkakTkWYtTizXwDuIA7KsvMDg5Bq0WAZbOFLElezLTtR0Dv3DnasgKuAF/+ZJthFMaS85HSetHtN3IgHiGtWJ1e8s09nW7G9uGNqkFo8Pi/cXA4GHD+D3ak2cy/YaX5J61pWbcdLQ9YM8f+pzoEK9N3T6S9gQB6Xwg6uAN+8f9EHOM/iERVdeLit7GgsC1UeBadM3CTeiMtx3JMUZEMAFLzaS37Tp93gCuEonY4no5zFHBNnMMKNr6OJ6o5imlysRAEaTBh8VpbdqR5u0SLmDk7ne7c5pk1ZUedMjB79B/P4wssB+WM4PFTnc5XLc3NHEFanzI6aIgkOp5z4q7gmuPhsHtJOu+dFOtAKr97XP0LQPgjpuG2bdXwiBrh/+EgHlbD/ti2s8uoYQez0HTwteQ6pZ2wpIS0WD1o4ytoFh5bW808rKaOYwtddSZW4ovPA71iruoApYFRdhPV8iyLgUBoz1sf9nYZLNFmDlaMm+OgkPtZ4KXoIk4pE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20acdfab-9ea6-4e34-b8d6-08de7a2d036e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 20:31:28.4756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xXqaoNLIOp66C8ikFaHLh29eTYCYJ9yIhTzfOdgDBb2UuJqrLB1imrvt3Dcv1SnGsFRWedA9qxpxWP75nm+chp6nYqj99YC77QTW/9uv8qA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5053
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2602130000 definitions=main-2603040168
X-Proofpoint-ORIG-GUID: 6pLR0E2U99gDOn2wWODdLOn70wDFoRyh
X-Authority-Analysis: v=2.4 cv=fKY0HJae c=1 sm=1 tr=0 ts=69a896a4 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=o5oIOnhZENCTenyL_yNV:22 a=WhTD90HeDMEikybhQEAA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE2OCBTYWx0ZWRfX8qvuLmnlHWCY
 +4Lntw/pQ8D+riO+ZvBWvIRkjoa9H9afsFY2HYK0isBMUo6sPttOwbfnk2RGb8YHbH8to5udbBu
 6NVvYIXhbP5G9vTD4DIy8pqjhLlhQV3E8WI6LAZ00rNBP+Ltb6ra4dfKLCtJPiXOxRiMR7TgpYj
 TtARjVUyxzr6RXqTCirVml61slhwmCpJKCKA9pcNdgFKer4rC0oqY/djKAUk32OjcKwg0mJHP5k
 jsR50b7xhGLNAAMmL8bdXm9JPRcgvmUKHzOPtCqsdHLcHRX+MkO/KkCowUVxq4i+IEUdTEo+5ze
 YPsVlJFfQD1A69kj13qXdvB2SVvwA6+HtgDdL+I3DmwliT0skbfgZufOgKmZU8irGU83B4+V3we
 UxMs+t0x0y6HbS1JS7zrUVmCooBEP8y67pNuMDgeQbXi2DHeZ/ixNbfgBlN7lV3pDEl45d6j167
 Ek5RFxvnOCxcdtw7pAg==
X-Proofpoint-GUID: 6pLR0E2U99gDOn2wWODdLOn70wDFoRyh

On Wed, Mar 04, 2026 at 03:07:44PM -0500, Eugene Loh wrote:
> In test/unittest/usdt/tst.enabled2.sh and
> test/unittest/aggs/tst.neglquant.d, there are SPARC comments that read funny
> in the absence of any SPARC support.

Ah, missed that.  Will deal with it.

> Should libdtrace/sparc/regs.d and include/sparc/platform.h be removed?

Yes, missed those.

> On 3/4/26 13:50, Kris Van Hees via DTrace-devel wrote:
> 
> > diff --git a/COMMANDLINE-OPTIONS b/COMMANDLINE-OPTIONS
> 
> Okay, but this file also has the line "All options are believed to work
> equally well on all supported architectures (x86 and SPARC)." How about
> s/SPARC/ARM/?

Sounds good.

> > diff --git a/GNUmakefile b/GNUmakefile
> > @@ -20,8 +20,8 @@ VERSION := $(shell ./libdtrace/mkvers -vcurrent=t libdtrace/versions.list)
> >   ARCH := $(shell uname -m)
> > -$(if $(subst sparc64,,$(subst aarch64,,$(subst x86_64,,$(ARCH)))), \
> > -    $(error "Error: DTrace for Linux only supports x86_64, ARM64 and sparc64"),)
> > +$(if $(subst aarch64,,$(subst x86_64,,$(ARCH))), \
> > +    $(error "Error: DTrace for Linux currently only supports x86_64, ARM64"),)
> 
> Okay, but how about s/x86_64, ARM64/x86_64 and ARM64/?

Sure.

> >   $(if $(subst Linux,,$(shell uname -s)), \
> >       $(error "Error: DTrace only supports Linux"),)
> > diff --git a/libdtrace/procfs.d.in b/libdtrace/procfs.d.in
> > index 23454d63..6a0e0122 100644
> > --- a/libdtrace/procfs.d.in
> > +++ b/libdtrace/procfs.d.in
> > @@ -286,8 +286,7 @@ define_for_kernel([[on_cpu]], [[(m4_kver(5,16,0), m4_dnl
> >     [[((struct thread_info *)T->stack)->cpu]]), m4_dnl
> >   (m4_kver(4,9,0), m4_dnl
> >     [[if_arch([[x86]],[[T->cpu]])]] m4_dnl
> > -  [[if_arch([[arm64]],[[T->cpu]])]] m4_dnl
> > -  [[if_arch([[sparc]],[[((struct thread_info *)T->stack)->cpu]])]])]], m4_dnl
> > +  [[if_arch([[arm64]],[[T->cpu]])]]l)]], m4_dnl
> >   [[((struct thread_info *)T->stack)->cpu]])m4_dnl
> >   	pr_onpro = on_cpu;
> >   };
> 
> I can't read M4, but maybe that diff is suspicious?  This is what gpt 5.2
> says:
> 
> ### USER
> Does the following diff in an m4 file make sense?  Are brackets still
> balanced?
> @@ -286,8 +286,7 @@ define_for_kernel([[on_cpu]], [[(m4_kver(5,16,0), m4_dnl
>    [[((struct thread_info *)T->stack)->cpu]]), m4_dnl
> (m4_kver(4,9,0), m4_dnl
>    [[if_arch([[x86]],[[T->cpu]])]] m4_dnl
> -  [[if_arch([[arm64]],[[T->cpu]])]] m4_dnl
> -  [[if_arch([[sparc]],[[((struct thread_info *)T->stack)->cpu]])]])]],
> m4_dnl
> +  [[if_arch([[arm64]],[[T->cpu]])]]l)]], m4_dnl
> [[((struct thread_info *)T->stack)->cpu]])m4_dnl
>         pr_onpro = on_cpu;
> };
> 
> ### ASSISTANT
> No - as shown, that diff does **not** make sense, and the
> brackets/parentheses are very likely **not balanced** anymore (and there's
> also an obvious stray character).
> 
> ### What looks wrong
> 
> 1. **Stray `l` and unmatched delimiters**

The stray 'l' is indeed a bug.  Fixed.

The rest the AI bot got wrong.

>    ```
>    [[if_arch([[arm64]],[[T->cpu]])]]l)]], m4_dnl
>                               ^^^
>    ```
>    That `l)` sequence is almost certainly accidental. It also strongly
> suggests you now have an extra `)` and/or `]` compared to what was intended.
> 
> 2. **You removed the `sparc` branch and spliced the "default" expression
> oddly**
>    Originally you had:
>    ```
>    ... [[if_arch([[arm64]],[[T->cpu]])]] m4_dnl
>        [[if_arch([[sparc]],[[((struct thread_info *)T->stack)->cpu]])]])]],
> m4_dnl
>    ```
>    That last line clearly closes a number of nested `[[ ... ]]` / `(...)`
> constructs.
> 
>    In the new version, you have:
>    ```
>    [[if_arch([[arm64]],[[T->cpu]])]]l)]], m4_dnl
>    [[((struct thread_info *)T->stack)->cpu]])m4_dnl
>    ```
>    The "default" `[[((struct thread_info *)T->stack)->cpu]]` expression now
> appears outside of the previous nesting, and the closers that used to be on
> the `sparc` line are now partially (and incorrectly) attached to the `arm64`
> line.
> 
> 3. **`m4_dnl` placement**
>    `m4_dnl` comments out the rest of the line. Moving delimiters to a new
> line while also changing where `m4_dnl` lands can easily break balanced
> delimiters, because closers might end up being "commented away" or no longer
> part of the intended argument.
> 
> ### Practical conclusion
> - **Brackets are almost certainly unbalanced** after this edit.
> - The diff as shown looks like a broken manual edit (typo + moved closers).
> 
> ### What to do next
> - If your intent was only to remove the `sparc` case, the safe approach is:
> remove just that `if_arch([[sparc]]...)` fragment but keep the closing
> `]])]],` structure intact (i.e., don't move closers onto other lines).
> - Run `m4` on the file (or whatever build step consumes it) and expect it to
> fail with a quoting/argument/parenthesis error if this is truly the current
> state.
> 
> If you paste ~10-20 lines around this macro (before/after), I can tell you
> exactly where the missing/extra `[[` / `]]` / `(` / `)` are and suggest a
> corrected minimal diff.
