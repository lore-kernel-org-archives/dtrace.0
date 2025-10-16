Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFD727A444
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 23:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760657869; cv=fail; b=X0ZewGEMKyCJsh/9Swp2Z83Z7yZ1eE+iZdM6Y6CdyDr3HBdsJe7JqzEgNFJC+4GWGhxYNjiWHnReBrVgws6dPVGF2AXn9JlVx1hFBATGZUI/Pz7ez8iSfe232SrpqLL8wywZOBjfAtz4ugQKA441Xek0AoffwG5ceoKafGlk8yo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760657869; c=relaxed/simple;
	bh=DYOxHAQIH7lqdGsvjcYGXTJkr2htMDkBKu4HY2W7Jeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PhxxsbMDYvoeRkDySxWluKKGUP9FmkuLzQ1hwDRVCC9V9LRlCHlCup8sbZPU6KisKD8/jrYhzjh0ykr7AOaaq09XecTn6ZQB+qWWnu6ehClg/AP5LJmIkw0dX1vTYM8T8dvxVYqMOn5/FIA6ouWS8SrxhG7/zOrWU/tN92n4Kzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MgZEBkFL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uOJcRHj4; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MgZEBkFL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uOJcRHj4"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GLu9m3008215
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 23:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=CEKmIycLJrQbah9XDJ
	YlUJtSj81SkwznT25lPKFB6GM=; b=MgZEBkFLMuAR9OiZvzgQtFc4fQq8FqRJ56
	dxfowNJIteAWuCPeTZSAfi7VBByvff2QysqbzadnXWvAUBKX9mcrnaodiViSrQgW
	nEu5VDljhl20rxpkE972piUZAtYFkcvuft8Duzw53ivwGXZCqHC7SABqNo81s43/
	3NqkFYlgY4Kyi1E8IAHVmzzf6rypH/N3xbT4bcxBYIrUpPVqe9y8HxgcKgXFhqly
	La7h52/uJ3MCfTJN1eyaOPH+/4LiP8McWI/6vwGecwfM4vQi2paoUnW32JkKaov4
	PfdTyZAM3BQoUsMjwsUKiKXtJilK8eLn9DVlnEaMQ2Dm3FRsxY4Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qdnc9x2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 23:37:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59GLStj2026034
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 23:37:45 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011030.outbound.protection.outlook.com [52.101.62.30])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49qdpjcahy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 23:37:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M5Dxdxt61orX/9d/Xzw0oLwFSbu3zlLaoWQnsTPNL+1Ns3Vdb87Hg+UlnwyutzoOYyQ2qcwJqEg2tfmkv6iNwJTaZUAZGFdKwQ5v6/9PydpkRSEDYttzY1vVHxT+rKKaERwcVfc/0OBiHgnKeAUyJPN1FzktAOyZ6UjTsRmmxdm7wfdlKTEEUyiSlEMz/Uot4iCGKrOnHzrGK7/KECoUzmlWiJJP2uL2VMbafqzfnO5222lCmqRLzOqDzI6qPSwKQ2g06uNCWzGdza2jcmx5z/bNx42rmFID3KM+MQ+wDewCG7sRn2ohjPCyT7JDlWIRCwy8qVqLfh3t/wMYzWp+kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEKmIycLJrQbah9XDJYlUJtSj81SkwznT25lPKFB6GM=;
 b=S/BlzMe94xRJND0apdKlut8+ovnPcBR9+5XZ8S0EXtxNbgZk/cSz0Jx58tw+qrx94NkK3JY5WxZN3Ex6GFT6cwSglwluyUTvFta0r0DvQb8pgH1nkGG1vnwhQaEkqlmwM0ccbZJ/CqvgSjkqLw139uAk6MU/v4Y1L7RN8CDubSYRQPa32R0X3kCYWL2WDtIk/yPLn1NE/gNylkZNjQiTl+a+jaiV1q+lc05Bxtx+uVkU63JHO+ASFrxbXdzGs3jCic4Mas6jk1JnH1EgOw7t931ZrQmQ9AWbXKW6WX5E6BeT1S+gtO6dQ4efpt79maOgWL5E+c1kHWwejFThHRMGvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEKmIycLJrQbah9XDJYlUJtSj81SkwznT25lPKFB6GM=;
 b=uOJcRHj4LKwTtm0+odIDJi0ajVRFjj6sJF1Immxte+c7vZRr1CyL4SpGBRAFWPttWDC68jaU2Yidg3pt2F7ealaPbndEahap/YMyqV756d5MOZA5+65z0s6N0Kactmmqj1IeENsAfHPSlz/WmwVuoKfhWkBju2sxOay0u4LsHQU=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by SJ5PPF136884A98.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::78b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 16 Oct
 2025 23:37:42 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9203.007; Thu, 16 Oct 2025
 23:37:41 +0000
Date: Thu, 16 Oct 2025 19:37:39 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Bruce McCulloch <bruce.mcculloch@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev
Subject: Re: [PATCH] Update llms-txt and add README
Message-ID: <aPGBw+TC++olxL+j@oracle.com>
References: <20251016205330.4055747-1-bruce.mcculloch@oracle.com>
 <BY5PR10MB39879FA7FD793F7F152D2677C2E9A@BY5PR10MB3987.namprd10.prod.outlook.com>
 <150a690f-7ef5-4695-8508-0661a0aade21@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <150a690f-7ef5-4695-8508-0661a0aade21@oracle.com>
X-ClientProxiedBy: BLAPR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:208:36e::22) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|SJ5PPF136884A98:EE_
X-MS-Office365-Filtering-Correlation-Id: bddcbcd9-d80e-4796-9908-08de0d0cfff4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xLjwKjXyUb5ARhVaBWpVCETmQqCCDdcCKCt0AgHpDHNfqGqyipjIjumdp9qI?=
 =?us-ascii?Q?BpN+C2c6MGeZR6uO3xQu+vvQ+jOzBS4fJbMECFPp+0hIcyqfZtvLpqksWqNH?=
 =?us-ascii?Q?tRTTDsQf8zmjauyw3IPDV2LPUZqcE3dDW8J7bHvdYpJ3IVhngMB2CPYU3pWX?=
 =?us-ascii?Q?hsoXQYDU8J8yRUWdc2fldqPjXqU1CnEdmGEG57cIPaXymEsSW3UG1IBgQJ6T?=
 =?us-ascii?Q?CZzo1tMDIs4k19LscGoRdnSnk5pAtIKXYIojjpWLIe3lSlct/5ZmhguW5E0l?=
 =?us-ascii?Q?gxsw6NeB7Ac5eTIjvcpVQejEA/0kAooqp9f4QeYkxYINPSCZA0myhifNFKp6?=
 =?us-ascii?Q?k1GWkXwtCH3Lh0gRR4d7JSdtvLvaGxCZHXxCUOw6uT9W03CQcgOhUqHrO5FT?=
 =?us-ascii?Q?cfPVZIpbB2e9OrOoJ6RAKE9yu2tgjLK7LGyKm8jw0Ju242BQFyJqRPCN8au0?=
 =?us-ascii?Q?P1GUDkKBbonEKDDUGIXGtHp1347yTLka3PWn+u17aND63bNYIB6hkMj4Sbja?=
 =?us-ascii?Q?gqdtttUIAfEUjEkWy5x77BA/Oh/SpgGUO2TbMA0UoCglb13dV/NKfZDvv+c0?=
 =?us-ascii?Q?kYJB5Y4ADPsveDtKKEoHMk4SM8vHIp+P9i221TdwJNhsWhUpm+TS3Fwrwmld?=
 =?us-ascii?Q?od0gBcfJVY3I4fcFBx0VLkvCApwpLwf7oaF2zC/zgIReCOfbJfBG3A7049Dv?=
 =?us-ascii?Q?aOsLZ3sfLfRewwup3HcDt6YHTvZCRaKN1OpjuFhxQTlXC/Mj94UQwJLsCNeE?=
 =?us-ascii?Q?LXPkNQpERNGoFDRQB3ouej7w7ynhZonc2eoOHVcSkSL8IF0C5UUeyiJCM+Lw?=
 =?us-ascii?Q?USoO5o+gz5QxHZHK8rd+h6+sMlbDTVzHwEAIsoZeZcZcAMIOxS41iYMXtkYy?=
 =?us-ascii?Q?1uGGvUwre2Lknvt6apbjHmeh5RYujI4U18RdhubcpKEeRa+b0EvCKeQbOVzn?=
 =?us-ascii?Q?y5A9+2fmeCGVbEEgWNPREqN2rzr25IhBcmH+Qkpzvqr/mqBC9KxtVsi8Oh9C?=
 =?us-ascii?Q?Ka4htoWUqzNLF8o4BFvJWxmlNOjjmzNbgUbMbvvF+Ahd4RWM8xGJDXzOs0ns?=
 =?us-ascii?Q?dNfWpdpGZOSIJFDK9B8vy6BYxX1nzhvizODYxLpMnvP9Djb/tsT9W9FSyUWI?=
 =?us-ascii?Q?4HSoGjHEYNY0iGZb0GX6X2hFRB0+5L7iPToB7oH/OGd7Er+5WpzBZLoHWKzs?=
 =?us-ascii?Q?RWmyZl4lxJq8dnHMKue4Mb91KQPaBB2jJ/rqP8l5q0noLgFbC4thRCM2JVUj?=
 =?us-ascii?Q?XwgKICCXOfs6CJgjRDe8rSxDj0a6kHLvT7o+i0WRY/TIElPMVNJZFbo76FSr?=
 =?us-ascii?Q?52M9uQYQuZACiWvxIxZDuouBLUwfL5cvBGLgMSWh5WYU2tQ+7feqrC6GEl6Q?=
 =?us-ascii?Q?7fTwo23wauo55KApxp/YVNfqvPFooEVMpDL6DtCcdNrCO3wk9Jfyzrkpz0f9?=
 =?us-ascii?Q?pw9YioVetEAsXgo9hPEPwhN6hElnBabm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sFR1nc9KoruWoQGaU2jJvNAbZmSv3GDyJEV1+JIP0HXs2xjXnZTcPYhsoASg?=
 =?us-ascii?Q?RE5SFhNhUNXl1VkcXp7wrmPmEUM/71txHyo2y27iP83LfNPSnBrz1eMSG0hi?=
 =?us-ascii?Q?/ZFa5RROfws7MUaO4CPqvASjjQ6ZKurGsEA2uRVmLxLf5Rh9vqD2i1qWSa83?=
 =?us-ascii?Q?dUIfFB7dv7MBzR0MtNt1aYrczlIEl2Zr8tZ3MylxMbottL9ZDhKuXXhc+sVV?=
 =?us-ascii?Q?m6AFl9qW/vGQkPObCzjmQ8Z623kOoU6fpTcGWlozL7D589whebHg3LgTE3dX?=
 =?us-ascii?Q?CRK2IvHtwk6ga+dFqE7If5ccs/XcYMpwrmc1/LqQYygdKM5BgfRnliCuSFsC?=
 =?us-ascii?Q?9U7zHP3Bv+sL/NbjvVBSKWngxQHIwTKqyoGbBZ9pxLNiHPRgvht5AXb+pdXk?=
 =?us-ascii?Q?pLQdUFQK2DTlo0ojzWJMmJyXSTGBCfHBQaYgAtTppCgiJyx52PW/M9BZTsFL?=
 =?us-ascii?Q?nVOBs/o3td9ob/mwpVaFzwZyY1T+HvopfEvoXEhR4cKm4GmKmOrnFimxkZJU?=
 =?us-ascii?Q?44knYvIdCq/JpLwdi3JvYZbBSYTeQWS4K7uN7BL9JUJ0KUW18fpYkZ1zCpnS?=
 =?us-ascii?Q?HM6uTBc7y038WE4PQcCBbO5njuls7RXi/+A1JKWMbQPNAPNdyGdVKNE1hymY?=
 =?us-ascii?Q?EMyeLpHxylvHHpYfywFRycX+1cebQp5QGrgfblXUdi1VuFdKt54VT/tOJ3gF?=
 =?us-ascii?Q?hlKeYWAzIJRz1hz9k97id91W/MUa51pSqxopbee6SrCUoVgXaqcHr4EUkI0p?=
 =?us-ascii?Q?rbYyfNOmF86Co0rGlV7zQnX87KGg7eRf3rlSzN0GvHxNsPZD8nQni6Ll+MtE?=
 =?us-ascii?Q?Eb4IiOTjSVWtpqXSWnREAEOAHMEiWd2VQ4TLlgIjfmwoGlH+bmbRwLBDRSsB?=
 =?us-ascii?Q?57gmzdpof8NNJ6s+1m7Mj2DUkSAU9NQQr98C8Jl3afk0sKYQ8S864VWTizqm?=
 =?us-ascii?Q?ltFmgfBnFNrG8VvjMNw+rDEe4IbMMOuc66Qld50Hh1gpRp7a9SUbPv9gl/uP?=
 =?us-ascii?Q?RvMBcEqpO5dkZUCEr2onJFcgNU5cgduJ4+HjLnkadqSj4WIyT6mbg2sz8/fJ?=
 =?us-ascii?Q?pSi6Fsc9hK6eDbI8TAq8dtRkYr8MzAE+rfxTFSSz7UjHe/jTCdykKStTZySR?=
 =?us-ascii?Q?iKniqEd/fyxEtDFx0x6qxXOMPrqmgy44nQcqhAEVWGPvNLrhn/ck6ePX/oz4?=
 =?us-ascii?Q?bgVAXNzGVo1li0oEc1Rykd2N4vPIvGjB8FQBuotKLyp++0mvkaDdJYhL5Hag?=
 =?us-ascii?Q?S4htNDFF6vUq6NqwMdfKIXwkxkVgcA3/ucKSalpphUWv+v1uNFTpg2LMS4q+?=
 =?us-ascii?Q?++G2sJjH3XsWDP21fv/esHx91b5iFaJvjeNT1SHSqJue42zpWYWne47waman?=
 =?us-ascii?Q?pi0Ku2sIlUTs7JewIwVWwvGdYkzW90SaThy8juA0yD8xoe/5rYkjhYWFlUIT?=
 =?us-ascii?Q?qUbfQb2dBw4D27QHFzcOlll8tKj0AZFkIl0lxviMcNFTdcC/ctTwsc/0Eic/?=
 =?us-ascii?Q?tZzGcUxmTAW3Y+2cwHpyYIWSiqivEQF1LItk7fY4xWfPttYEIyIgpIOWdeyj?=
 =?us-ascii?Q?8DiF15elnYOvaBwebwDyNK017/XH6U6+1RvXvHegb+1nTUQ1DBQgPhh9vimH?=
 =?us-ascii?Q?0g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/JAs6wIaJq/UsiTFisAuKfXN3uj6Bg7B7CdspPRKnIMhYLALJua8sDGy5iYS5ie+Q5JEQuOImZsOuqgz5TMFhyTqrT6nFPvNSW+qxExqw4FZTbFg+XNjEm1OZff0F3qYjF3Y1bXnWNiAjgh6iAXsSQ8LL3V+ZIlSgTuyGCEouo5c6IPk2IFSOydT7HqKixjt7VhWd5fN196glNONDhm8MdmSBfjGl0UJMYum8ipIDLszipWHAoa5BsHpAVw1Klyg2DEC2xr8189U77q+nf3itCGXInDLrxt9lQ3ZnmnMknr/WdrWiOxlvFgre7GIH7fo/rXnUzgLR5BGjXUG7AbDhYKIy+cEEelpyyWjdLmvCCd/DbHnEfSiezrpPxuLduuJE58DJXvlFSr9a0eppcJrxswqhk4Es5oqElUO4T5eYjRxhxrd0xxV6Mzosff79S9GWxuvNl7WI+xWhnRKKWAsasWndiwaCGUY1IuTHgeiIlXEXDLsQkpra2buF+R3he0RCLXifgFC3sTiFeGXn6m+3D1J2bGuB/A4VcUM9Sk2gbpsoxobtHvrBEZettGOlBVdRa8yAbUE1eUR1lXJpmWimCajh4CGNNhiGHWxAov25xw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bddcbcd9-d80e-4796-9908-08de0d0cfff4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 23:37:41.9245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: csqyZlwuv3O/jMJBaXILcp3JD5TZ35BvDOWfbHJeOwJjPGzjpkjPedg58D26ujbSQHzQVO1BMqooSCuBVlVJYlAWT5Sd77kThJHT3x4Uh1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF136884A98
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510160178
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAwNiBTYWx0ZWRfXwQaK6xpNBUni
 taZ+QJ4nyQQKbuT91f0Zp5W87byIMsC4dQ86lXMtLtBq/F4o0OvytdZ6f3yKe2fjD86agiJqoT4
 24SUnZyLUJEh/dVQ0uzkC48nE66wOtJVOeWwwUlIzjHeGZRixHSSDOKGgUmI17py7wjAdCTCPiV
 vrgL2/rjqo8YQNqLE2vtW4/f3VDf3TIF0aFgINAITPdSolbr38xX1YrorCwTk7Af6L/KX+eScPi
 li41WfqUIyPZ46PxMu/PUME8lPRMnEnHZa+W5z69rY6T6zwtiCCrPnwTU66qAKr4SrEuexmAgqQ
 okkPGayiNJwRgVfk/VefzB/owbVxpww+D7w1uEtD1GuNeFsNHs7AwvWLPeI3wBjHw2IOLY+iX+D
 iTMRe+2HY+QYE6Bh1NIynOekoM1BZHWPtmEACLe+VWOs5zQfmLg=
X-Proofpoint-GUID: usGd3MR7eKk8K5Oxf-AsLFui8mR5UUVf
X-Authority-Analysis: v=2.4 cv=ReCdyltv c=1 sm=1 tr=0 ts=68f181ca b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=GEs3ghBQQeLriRuU5zgA:9 a=CjuIK1q_8ugA:10 cc=ntf
 awl=host:12091
X-Proofpoint-ORIG-GUID: usGd3MR7eKk8K5Oxf-AsLFui8mR5UUVf

On Thu, Oct 16, 2025 at 03:51:12PM -0700, Bruce McCulloch wrote:
> 
> 
> On 10/16/25 3:25 PM, Kris Van Hees wrote:
> > > +## Files
> > > +| File | Description |
> > > +|------|--------------|
> > > +| `llms-dtrace-short.txt` | Compact reference used to bootstrap LLMs for DTrace knowledge. |
> > > +| `llms-dtrace-complete.txt` | Full expanded reference (available from the [DTrace-utils repo](https://github.com/oracle/dtrace-utils/tree/devel/llm)). |
> > > +| `dtrace-llms.html` | Blog-style introduction explaining how to use these context files with LLMs and why DTrace is well-suited for machine-generated tracing. |
> > This file is not included in the patch.  I would expect it to be included since
> > it is referenced here.
> Ah yes, I was initially under the impression that this was going in the blog
> git, hence the inclusion ... I will remove the reference.

Thanks

> > > +2.  **Load the context file into your LLM session**
> > > +
> > > +    -   In ChatGPT, Claude, or another interface that supports file context, click the ???+??? icon and upload `llms-dtrace-short.txt`.
> > > +
> > > +    -   The model will automatically ingest the reference and understand how to write runnable DTrace programs for Oracle Linux.
> > The context files are not currently included in the DTrace RPM, so installing
> > DTrace would not make them available.  If they are to be included in the RPM,
> > we need to determine where they should be installed and then these instructions
> > should reference that location explicitly.
> Good catch! I'll include a link here.
> Though, to be fair, if users are reading this README, they likely already
> have access to the repo that it covers.

That works for me.  I don;t know where we would want to install something like
this anyway, so not installing it at this point is perfectly fine.
