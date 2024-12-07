Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB432E822
	for <dtrace@lists.linux.dev>; Sat,  7 Dec 2024 04:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733546413; cv=fail; b=DvzC24Btovg3nZwFb0+E8FLLfbtJZCMM7jOYMfr3y7W0ThmTtLdwXJqNEq8jW6oZ3xvDszdYtlFRhzWIqAIhY9ZsA1z35nPzrupkAYJefvGHOrS7uZJjrELc66J2l8Ul536MHpnbKz1f0FiSVfRz2TroGgAoR6zoYP+P91g99QY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733546413; c=relaxed/simple;
	bh=8hTB5fYPp0eI/rqafruNky7yuTMAIOWSBJ8yyUtRrLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AEN+WINFrlZlTVPMIG9hl31E2zEsk6rLmyC//BpGn4X8lJw79yChqbX9D3Q9IEKrTPe33jJlve51MkJh8ZDJb+UkZYFswxLukG5oBX8TJaQraP6G0MT13DGc9bqyRbXbFgbDpD+zZODwwdVWlhCIWznzASmaEJwMPSeKnoTh2Q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JDiMRpI/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ubdSJsa5; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JDiMRpI/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ubdSJsa5"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B74HdT0022495
	for <dtrace@lists.linux.dev>; Sat, 7 Dec 2024 04:40:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=mbxJN2C3hJ4/vm4GP3
	5GLVcJ0NZ4wRc10mon388EQZE=; b=JDiMRpI/3d24sgPev5FLOEKQbN8jdOply7
	wveXcN91VlvJUjSkDXOsKKJbctnGyKKk+6xZTI/49AKfaqjg7qQMFhILfGQmteSW
	T9Uw7Oy6l/okXMziEWHBcYtsMuOyMsWHNNcJW3FnA5DX1KRvwxr+eLSRlaP8ahHf
	dLuBK+B5Ja67870k6nwgyT4CG3BnTaKrknBaUTBU2kp5RNq29QCaaM/AIwVwtWhZ
	zFmx4Y5slJWZHzJtNNkLwdXTZqK5atnltwxnbHNDbXX5Jo1tcxn4uvYUi3pcRJHv
	ckUgm2t4Ndr0i8ke5OM/O2/BJx2ixLKhchQeF9oFuIfGk0680+zg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43cdysr2nt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Dec 2024 04:40:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B71YLqJ035648
	for <dtrace@lists.linux.dev>; Sat, 7 Dec 2024 04:40:09 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2049.outbound.protection.outlook.com [104.47.58.49])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43cctcjnmd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Dec 2024 04:40:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kItL/xjfN0Q37s2+RhjAjJa6Ka65VrcY3Jq6fHm3MQjrDx9uAGwgTAKfwnyXlsK8PheiUsgiXJoJHajCX8sy2NJF9MZQhHCkttsdE1Pf0RzC/3PIEWJD7exmobsTKS9bLNVTNz9eBuxabJBxUrIVcBF2oIUZ+xATKm0+9AaHCe3fnoZxs44Ml/4AAxzYrGci2j+/zg68ZlXvb64gzyCHRyml9nhnahjvjFW1Gs1P4vKth5xprD/l9w8rJa7IgCVRxTEVibkdk1DThiFpk1Non6YQxIlTQPcpPL17yj6a36jGWlFwDrIiAIEPTDHK9EmPMRTfwTKoGIxG1utJoVrXpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbxJN2C3hJ4/vm4GP35GLVcJ0NZ4wRc10mon388EQZE=;
 b=dDery07mw29hbch7OgCveqP/YoHMrhHxquJ17m6IH+6y8LPuW1Kqk9llMZumqlztKNP9QkUhh14DcsM5kdBWdpuuCVJlnZznI5dKM4XrqRAFodI3BvtFfrC0RqFsEKbY2jOmmttjvA+a1Kfub5cDed7pho3UcB9no/1AaKT359Pifc0jINNTbtXmjI9K3ZkFQpLoEcItyZy/+hc8M+xQPb0zeF/8ateFnR5ehroB3QaDywl4Yile5nX+/8rvoKXZgDMQz4JL5ko3d9pyJgAFv+hIbog3ODTtEDLT9GectBrJjSjzCglp2BbdjZZHWMgzErB5/81m0bhUaam8rWtv8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbxJN2C3hJ4/vm4GP35GLVcJ0NZ4wRc10mon388EQZE=;
 b=ubdSJsa58VeGDaLa2gNmX/qPlgpT5ZgmwE2QQNfwa3ImZ/F0BNosMNFdqOedziGVWoKXhdWXVSSnb/dsA7qE8/jFyHHp7OVYIzeDjEGB95+N9LqECdUPhzpZyu1UUIDJ1rcb460vOIuini8FfrvVk4lUdONU1E/KtYbmO2EWpaQ=
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19)
 by DM3PR10MB7971.namprd10.prod.outlook.com (2603:10b6:0:b::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.12; Sat, 7 Dec 2024 04:40:07 +0000
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe]) by SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe%5]) with mapi id 15.20.8230.010; Sat, 7 Dec 2024
 04:40:06 +0000
Date: Fri, 6 Dec 2024 23:40:03 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com, eugene.loh@oracle.com
Subject: Re: [PATCH 5/5] libproc: drop Pgrab() special cases in Ptrace()
Message-ID: <Z1PRo/42yTT8qfsG@oracle.com>
References: <20241203113610.75104-1-nick.alcock@oracle.com>
 <20241203113610.75104-6-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203113610.75104-6-nick.alcock@oracle.com>
X-ClientProxiedBy: BL1PR13CA0436.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::21) To SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB6350:EE_|DM3PR10MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: 75216850-6421-4a24-756d-08dd16793975
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JzUT0CjtUFuBh+iqdKD10K0DPR2nSjYNa/8gU1Q/UeAc7kSlo2LZKtivw6jZ?=
 =?us-ascii?Q?v/0O7uZuD4tpRp8BjKlqMs2lKMOiTSUM2WwkHL4Fl2zgaXkzC5Q/+oiief7g?=
 =?us-ascii?Q?I1Kn3bfEU4NbazdSjcx+0YVsKCiCSw11V1xWQhhwTiSaUDSU6Su8SRSKNfRG?=
 =?us-ascii?Q?WZz4tBLzhiZFtovxxdqmHsTbKOSR8P20TpBwcMMP2TUvREFBNwq8vgbqaJxc?=
 =?us-ascii?Q?TwuZHlJHp4IUGzjf3glpHCcYH9rtxIuSQSO9FYIPaZtOko1ML3Gezz3YuSgn?=
 =?us-ascii?Q?+Ja5r2qcFnw1CemiOL6Do3N6+LHukcFWyPnwk5lIv0w6VD2Lpd3kzYCypzEU?=
 =?us-ascii?Q?9X7igs3rTFY2RsJRvo6QVG/js9PaNSPRfVFNcrBOqyeeQgPPMW+BAq0CjwkD?=
 =?us-ascii?Q?eOJyofpgzZRYGJg7hm/s5zuYZJSQAIj68gDSlie5uxxvdedhmrBZesBZ5EmC?=
 =?us-ascii?Q?6K60606CBsDEDxYLizLQwjoYsDTdXKpoQA9EKBMrZUmwKFHzsfUrt9KgJdxf?=
 =?us-ascii?Q?BPG1rGq7g0KePaTzdpbnZNrBN5264yVLdC2LDgTHkAcdubCCfNuFD6BwZStu?=
 =?us-ascii?Q?fpTjJmh/rIPPke1eGSmmFAB/Xf+shtGRgCPdjreLzSnSPDlseJvoma9yf6oi?=
 =?us-ascii?Q?EHHkHY5gh0wWuTIJFhoHQptFCbr/6syIxDX20uDzkX16u+SYRxP2jfi4uKIf?=
 =?us-ascii?Q?Tl1bpRuFTXXspCNbCW0D0M98yr6ciI1gE/yYjma3d6xr3zo4j2+kJe3lw/Xa?=
 =?us-ascii?Q?D4cgvSdomKYUTCPzpCD0VtCiBhofBaedcgjIMcF265V3s1ug3fTwPkVwtl/V?=
 =?us-ascii?Q?VFmE5yJZxsI1xtUYTzTKKbRsIXwbx6pdg08zIyGBR1az+GKFL6/CAdJc2nqb?=
 =?us-ascii?Q?EFZj5D5GTd6sl789g+9APSLpM4oWNdxuiusVobjjvwrLrsSjY8yxN8UzAoDp?=
 =?us-ascii?Q?8Izb1rKLBwcSXO6U6Cs/cFgOG6aU51X+3pFiXa++IRqJVEbxI7sWBvWlYLDU?=
 =?us-ascii?Q?xCoa7DKxWUc+6ggJrHZVXQ7JwakVidigAJzUgFGg94OR1U/Nt8nNTeBdnHbd?=
 =?us-ascii?Q?9yZdKM2e1ASG6ELjftz/oF8L0wWFMeb47BQK0newX/Bq8P0r2jogHi0p5veB?=
 =?us-ascii?Q?YHt8dGk7GXn6j/nO8KQPSYedtTdRXOmpvnksFsRMoyUTjSM2sr4Z4PQVvGIa?=
 =?us-ascii?Q?Mg0kzQJXxQNCu7mQx+QK/28ZDZl2lLlLqoSMMm+DXfirzXeg9wNxMfmJ8Zfk?=
 =?us-ascii?Q?bh0C8CISwn99r/fY8H5BhM/FtfPam8Gemm1amm9ikwaS0h1v9zWpHyvtuPIV?=
 =?us-ascii?Q?BlsAF2z2oe0bdYILmcxGk/q/1OVDumdH5wk1x1QzUzfiaA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB6350.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1FtLbbfAnWXHTWoizE4qOPo81VXDIyZK/ZyuM2UFyWa0ar1s9dRQe11VpkiF?=
 =?us-ascii?Q?ZYTjAJURcE3/lUV8Iwz1wjznSIHkuECO7PKTjRQX5GS25Ek8j/Vbu2VXQHRw?=
 =?us-ascii?Q?AysR1/agjW/uwVmzZ4Mor6BjDclOV3Fw08gx12o7RsFE31xSkU+ZTt/Ilj8w?=
 =?us-ascii?Q?KFLYkn4FDKaP1veleq2ClTqLryQWgfDy7riuvJxaSnqHhCMtM04ES+CwLE7Y?=
 =?us-ascii?Q?/e7fQlFyjwPtTsvJB7uTjv48NUulGV0iLU1z1ycAN19f8IP8gmgiIbQ+8o4K?=
 =?us-ascii?Q?t23f+B3diqOyGWZcphMqXZQRSvSmZSsSgtsEr/TQMwVJbOttf37lHBCrB07J?=
 =?us-ascii?Q?IqG0Ddrx1GyCbJPtACI95uN7fUBA4eSLK/lDibnV/uZ8F/F/wWxKT/TAzhz5?=
 =?us-ascii?Q?7VTiPwNkmgv8HpTeSnf363ATg+1Zd8S6SWKj9L7qFCr7EX4R6l5NPHRV+ZYy?=
 =?us-ascii?Q?cWKKIJT5DB0MeRPv+gP6ST5rt+cZKVXumw3NV8El0Le9Mz4XRpdYqPkcYO1R?=
 =?us-ascii?Q?P2BgUneq0HzxT9o5+9wwwzfCfzHwjms3xpBLLe+yHgi9BSgGU8nxaflXUj7i?=
 =?us-ascii?Q?9zYbDyl1QZPKgdKyWpcBHMeNQTM5L+4SVCAPr1VmP3XfjHltB+7vQhN4SdYF?=
 =?us-ascii?Q?qVk88+NoXjjhZ0LIy0XWMaaVtLND4cVFD73oCnh2o4LsksJgNQZfA7Y4KpSy?=
 =?us-ascii?Q?v3SfQJGM2FltqhohuzR1UgW0A3CBI8Dlpczx/KSo3ItDCPMg2p2LZBe9tyC4?=
 =?us-ascii?Q?VPaxsEQ8omiN6dLRyIGIzWkZ3jjxWpLEO6O5ZPyAQD8FIxcgSlHeAKSBBSzd?=
 =?us-ascii?Q?swAKQ22UWhBoyWn3hIJkkcSOFBn08Nuu+L9h7ESkAfERPg8THTf29SpKnc5W?=
 =?us-ascii?Q?H2h+PaXgkejHuTHf7EbA2YpinnMmARBlaxaUMavHqCU7ezd9nVqzmoOoASu1?=
 =?us-ascii?Q?tZOcsxeTQ1cSsC0xNUdcELH/6RaH71RtZWxRrllmXrRr7BKD2R/QljFtfw+l?=
 =?us-ascii?Q?6XvqdrK7uYS7ylc92LzAZ9QtHc6IM8AH3/5wlmt/CLf9a3Hx4cdMLhRjg5Hr?=
 =?us-ascii?Q?o7fiqdsqSJdKYT8FMcqnjfCEJhRV6yhTrquRU0P+3W0eQ9Sah724VgXMwZk7?=
 =?us-ascii?Q?1cJWGuKmbfAwaMwcN91qrTIAxuPTBS93zfj8x9wIMGe2Ay6deeOFLunUFmFk?=
 =?us-ascii?Q?k3dyg1n4V3fsuSLi9j3VjepziQVnTVO4S4Btvrcn3roAGkL0CdiA9y3gebsC?=
 =?us-ascii?Q?QykLVijlMSQ3a05aKQPrSYlUhwlZVVG1Uk76PEZxHdIIGWFctA43UfOWfsa3?=
 =?us-ascii?Q?PvfS8/+sMlEJCHXOu+tYCeDj/ii0tP0cwxIL12fDowrkgEjK71MJ6AeDLKmo?=
 =?us-ascii?Q?ztZ89wTrzPGn3HUE7duOsgS0WD/T9nhFmI9h+4qVXTb0Tjo31EqdqmwBxphP?=
 =?us-ascii?Q?brIdfirEPy23rrPgfRDXfd7j2tlY5sKqnBT1el9UltKOU0RLJssDiXdyed/g?=
 =?us-ascii?Q?6/c083UHTZbYBF4gw2NpTMzu0k4YdROpLEKIQZQe9HB3tVjQbkL2gPtFAlz2?=
 =?us-ascii?Q?bkhpUgMG/Ot7MdqOFhBzH4EmfVpdRk892eep1TZQATchXenASaGwEqGjcLti?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3rDjsu6I1t1TB3JgFJyka/UXMGwRem+IzCe//g/g0+tm7UumRhDbB1SmrgSlwBxCRNuKj0f+/gMLgOWssfNvJ0vQqVphO/n0AL28xgElmeIBUI0PsgSUOW3qk0GK7cheYx6LaRcNkhfJKIueESn8eQWnIWanerpbOKniaTIgZr6z4zdC4l3vLw/aUkl2ecAM/rnWkE5c7gghVsRY60ZZtt3FUhW9NAuTcDZFiT79CEJBxpKQ9w17A6RjVM1lSnQmIjht0Z9ksT6i5nC5Gawm+4W8xLxZNPi+IZyGxqxIeP6sr+g1Fh6Ve7q6VYnciHmJqAXxxAUOe2DeQzaXskYJ6F7ZH6StIpsZejCK8agSXHTiUEkQvskLqKVnPvY3fID2PTWeX8U6Z+NJIbR+ay9Pk8YxbvhLBS1c+UKIZVZeBQIupivDqIu80uJsVFQuVyYxKuVVm5XJsl26QYeaZR59hPvknWohMdDdsVJzQmvyE5U2ZnvY6MDLbNUnF1lbJtW7dMfvA7URU3yQHCk1VFreISBsM64yuoct9QfrrpfsaPitdDlFLlJxLnV/kIBBgWZawazQwT1Y/F+z3xg2bBayF2P+3PplHzh6elZ8b0zPv78=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75216850-6421-4a24-756d-08dd16793975
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB6350.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2024 04:40:06.9071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HJ6S6+HdL8IdywK0EgkLxadlLxNFbzdP0EKx2/ye05aOH7w/o9RwF6kW568v3Jq8+BRFBfOcblAXHbNPDPnVu6hNf+VKoQFXumB3dh4npbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7971
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-06_18,2024-12-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412070035
X-Proofpoint-ORIG-GUID: xG4Wgo4uQX_gBFtfW44xTL3mL4soExWS
X-Proofpoint-GUID: xG4Wgo4uQX_gBFtfW44xTL3mL4soExWS

On Tue, Dec 03, 2024 at 11:36:10AM +0000, Nick Alcock wrote:
> Way back in 2013, in commit f5f05eb28058f2a62efeefef7c5faeca62b09578, we
> added a special case to Ptrace() causing it to not fail with an error
> if ptrace() failed and Ptrace() was being called by Pgrab().
> 
> The need for this is long past: noninvasive tracing provides the semantics
> this change was meant to provide, far less unpleasantly.  Worse yet, the
> patch is not threadsafe (even though we can have arbitrarily many threads
> monitoring arbitrarily many processes), and worse yet, the noninvasive
> tracing support in Pgrab() wants to *detect* failure to ptrace() so we
> can switch to tracing noninvasively instead.  If the failure is hidden,
> we assume ptrace() has worked, and our first attempt to use this and
> waitpid() on the traced child fails with an -ECHILD and causes us to
> assume the process dead.  Since it's not dead, bad things happen:
> 
> libproc DEBUG 1733155118: 386060: Ppush_state(): ptrace_count 1, state 1
> libproc DEBUG 1733155118: 386060: Ppop_state(): ptrace_count 2, state 1
> libproc DEBUG 1733155118: Pgrab: grabbed PID 386060.
> [...]
> libproc DEBUG 1733155118: 386060: Activated rtld_db agent.
> libproc DEBUG 1733155118: 386060: link map iteration failed: process is dead.
> libdtrace DEBUG 1733155118: Called dt_attach() with attach_time 0
> libdtrace DEBUG 1733155118: pid 386060: dropping breakpoint on AT_ENTRY
> libproc DEBUG 1733155118: 386060: Ppush_state(): ptrace_count 1, state 4
> libproc DEBUG 1733155118: 386060: Ppop_state(): ptrace_count 2, state 4
> libproc DEBUG 1733155118: 386060: Cannot add breakpoint on ffffffffffffffff: Operation not permitted
> libdtrace DEBUG 1733155118: Cannot drop breakpoint in child process: acting as if evaltime=exec were in force.
> 
> (Note that we weren't even logging the fact that Pgrab() had failed, up ther
> before the [...], and the first visible failure happened some time later,
> with entirely inaccurate messages about processes being dead and the like.)
> 
> The solution is simple: take out the whole horrible Pgrab() special case,
> and treat invocations of Ptrace() from Pgrab() just like any other
> invocation from anywhere else.  Pgrab() already deals with failure-to-grab
> errors perfectly well, if we only let it see the errors at all.
> 
> With this in place, test/unittest/usdt/tst.multitrace.sh survives 200+
> invocations with zero failures.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libproc/Pcontrol.c | 17 +++--------------
>  1 file changed, 3 insertions(+), 14 deletions(-)
> 
> diff --git a/libproc/Pcontrol.c b/libproc/Pcontrol.c
> index 6a454ef86bc3b..7d9b5055f8201 100644
> --- a/libproc/Pcontrol.c
> +++ b/libproc/Pcontrol.c
> @@ -39,8 +39,6 @@
>  
>  char	procfs_path[PATH_MAX] = "/proc";
>  
> -static	int Pgrabbing = 0; 	/* A Pgrab() is underway. */
> -
>  static int systemd_system = -1; /* 1 if this is a system running systemd. */
>  
>  static void Pfree_internal(struct ps_prochandle *P);
> @@ -327,9 +325,7 @@ Pgrab(pid_t pid, int noninvasiveness, int already_ptraced, void *wrap_arg,
>  			/*
>  			 * Pmemfd() grabbed, try to ptrace().
>  			 */
> -			Pgrabbing = 1;
>  			*perr = Ptrace(P, 1);
> -			Pgrabbing = 0;
>  
>  			if (*perr < 0) {
>  				if (noninvasiveness < 1) {
> @@ -1373,10 +1369,7 @@ Ptrace(struct ps_prochandle *P, int stopped)
>  
>  	if (wrapped_ptrace(P, PTRACE_SEIZE, P->pid, 0, LIBPROC_PTRACE_OPTIONS |
>  		    PTRACE_O_TRACECLONE) < 0) {
> -		if (!Pgrabbing)
> -			goto err;
> -		else
> -			goto err2;
> +		goto err;
>  	}
>  
>  	P->ptraced = TRUE;
> @@ -1386,10 +1379,7 @@ Ptrace(struct ps_prochandle *P, int stopped)
>  
>  		if (wrapped_ptrace(P, PTRACE_INTERRUPT, P->pid, 0, 0) < 0) {
>  			wrapped_ptrace(P, PTRACE_DETACH, P->pid, 0, 0);
> -			if (!Pgrabbing)
> -				goto err;
> -			else
> -				goto err2;
> +			goto err;
>  		}
>  
>  		/*
> @@ -1406,14 +1396,13 @@ Ptrace(struct ps_prochandle *P, int stopped)
>  		if ((P->state != PS_TRACESTOP) &&
>  		    (P->state != PS_STOP)) {
>  			err = -ECHILD;
> -			goto err2;
> +			goto err;
>  		}
>  	}
>  
>  	return err;
>  err:
>  	err = -errno;
> -err2:
>  	/*
>  	 * Note a subtlety here: the Ptrace_count may have been reduced, and the state
>  	 * popped to match, by an exec() or other operation within the Pwait().
> -- 
> 2.47.1.279.g84c5f4e78e
> 
