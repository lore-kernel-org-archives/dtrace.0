Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE18521FF26
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 22:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768515502; cv=fail; b=DDr3DpQS6vY3f+gGqIcl13jP/jCnVUYLE/Hbf6VaySlklQyWh/sNH+O5DnweIiAtck/rDjhMOfTj7njrY6jbjqLwt4XS4ei2EACcYZJmh3qrwZ5Qzz6ScF49ZIbVJ4uyHKXqHCeay2SuzxUl7Sgte30uTKYGmqu3pCidVWgxslc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768515502; c=relaxed/simple;
	bh=0INGWS4Aqack601VeEXWZ5j0J5Gr0bz9gfzb+R7A7wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qDONd5xT2X8X2jOhs2I/WNYHoE57t2x3ZNIyThxIO4iRyGGSOR8gOYF7Kky0m0tG4ACfVIMrbsWphfaxnDFK5+yDuc582qn6/b9HhF15Zh1pB15gVIG1UPwheputH01Z5kNGAGV5lnMMKg1HUfClEGoGv5Hxe13jY6J6i5G/R7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fxpe5QNV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=O7eF2lLh; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fxpe5QNV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="O7eF2lLh"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FEoANl1362590
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 22:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=P7WMSZee9MJEeHCkjy
	KQ7xzBEyAFUv1hUnnUrM49ixE=; b=fxpe5QNVqyNq9jviNj5U1LCQOOgum2k1d3
	rxGofk0eOo9ohQUCfWKDMvn7Mo1OvySWZVMS3TvTIx3A7nALChbdBVBgoT4dKgTu
	iDmoIiGIdD6F8aWH2sdFoMKfS4Rj5ODxKR+bFV6mdNaDeAAfukuWvCoAoKbQZS+y
	uvlDgC0g2EwhXYDpoB8JtHKpsNWB7cYp3803gD1raXfQrl07RrG6i1sMlmWVW8Ka
	pkoQXRJt9pAyLGqQhzaIZPpZz+9+0KagsPaCJYe3LiKYvhgZj/LRUCwVIJZIFySu
	RJ4And0oniWCZiqAkBsqX0552vJxKlHj0onltTl1TsrhjxI7Q5Sg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bp5vp43s0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 22:18:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60FLdts1009468
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 22:18:19 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011004.outbound.protection.outlook.com [52.101.52.4])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7nq660-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 22:18:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fw4lIrATQe0YNbGfSYPazp9gpSz83aPcEoAWWyLe/lAHQI7kERZzQTpETU4ti1ujs+12YssOeVYKMRw7acdyYvoI8poa04Bp2RzA44JB/rXlABtCAN5pMVr00r1uWTWAb65IREhkLOOA95WKZ8f67xewAuOY4Fd6usPm5VmPVbiAsQE/WgojbZ+87tc6fbh516Q4l8rOe3A6lHSEhe9Th6yoySrWRu+oNQJAn3Y/gVj8Oar8FxGyV/8Rl8bC2sf8Kou5Vt5tWBGqGRBn7bIIUn/SMsU1RHr6nwlw+S9cUsjY3GTfsBRrxgMflewGz5rKR/aLdiKhRE5/31HYjqDdHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7WMSZee9MJEeHCkjyKQ7xzBEyAFUv1hUnnUrM49ixE=;
 b=HfRXTTF3Yubh5nni91tJIeOh5IL5PFGfvQbNHlS0QT4Uv0s8LbaEpVG5NoJc7p022yLoZvJJ/IQSjC9wSKqv2LjuxHzUrTqZ5q19XIjcixep+OuasNXxs40O95qa5XmAeAybskcdp/Cft87w8VzJJjMc66Z5I9cR889nwtLs8YugrW5BCKN0Socu1f0bdMv5EIOUyttL4Jsd6WkgxyygLRwHA2jWVgN6C4SgwvBX28tsEGUSJEZNbUrgCZABiAtiOry4S385JHD/EtCmltTTJLtoVzmCwkK+T/w1RLofvrsqbMeMJX+UcyiwyxEJOVED8qKRcJovq/n/TGBTiIGahA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7WMSZee9MJEeHCkjyKQ7xzBEyAFUv1hUnnUrM49ixE=;
 b=O7eF2lLhkfURwHUeM0T8HDmUu3PUV8YlTbZhz+hX9Gbum/lWgrbQGNsNeUbQaUuAqMt9QxS0uUREdxAUd3Y48QdyK1NwoYmJNIxmaMiw8xt7stJNYhmYgEoGlhZ2BLNUn6eZVnx2ht6CUz3scYtq2FrDSW53orU9UkFKS3Km2XM=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by PH0PR10MB5577.namprd10.prod.outlook.com (2603:10b6:510:f0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 22:18:13 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 22:18:13 +0000
Date: Thu, 15 Jan 2026 17:18:11 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/2] rawfbt: prvname is not properly set
Message-ID: <aWlnowR5WC8zzdd+@oracle.com>
References: <20260113214205.9159-1-eugene.loh@oracle.com>
 <20260113214205.9159-2-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113214205.9159-2-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:208:36e::17) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|PH0PR10MB5577:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f8c466c-814f-4458-c08d-08de5483f95e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?p4TmeQVw/QwPfSBIZQkVJd19ft3AM0f03ig+rA3EAoT1GVhbjysWQjZbfAfC?=
 =?us-ascii?Q?2AYgrrhnPY6SxKZOCzl+emtcTh5IgEEO7Jg8ZGF2Q6dq0P7odfDJi8agH1p5?=
 =?us-ascii?Q?LoYxykU+OLSDsOnR7xWXfrufBuq1YZQ69ZaNgJ5r0qB+085eOzBVoVDnv3xr?=
 =?us-ascii?Q?8Y29mLxHMytkw8X4rOL7tNmYIcG7wTRKFtUltzaiLgx+FxstMaZ2XE0B4Hxe?=
 =?us-ascii?Q?RDLvbA18CNaTjhmIFZdiLhr09o2xjhCNJVovctzMKTNDUATm2Tt9kMzSeGwE?=
 =?us-ascii?Q?UlvbUHZ7ixNznKtewXrAeyH81mm0zf5/MWofDMWWhjTWdKsmy5+dE5bPqdFA?=
 =?us-ascii?Q?7fgH+Cg5Uo3SJ7hj6abDuwvgh+pF8obhZ8jRkiKk+jOQFAUEDJ3AXBe52yua?=
 =?us-ascii?Q?/8M1YXOfWSdljXVqBrpllcJNwlB0RrIPRrhDfvS6jA8WdmyIB8s7wJPWw2g7?=
 =?us-ascii?Q?Rz5tVBiaX7RsiY++hoFvWw71pzamg67FS6RrSrl1FfSjduKC2aZD72pFRM39?=
 =?us-ascii?Q?UXziWqgBkBqp45teNszcxhmFQw3Gi044GmyN2NaKWjdRkz+tlkVr6EpSr6mn?=
 =?us-ascii?Q?QLeoJ2ycYxHvu8DD7csQ3OVzNM1gq7JkiwkVPPJmbELBgtNlCRCnoIdtJ0bP?=
 =?us-ascii?Q?D2jzf9NeuEiRO9vTurlaF0qGbXJhzJmKQ/LvkbswM489TnLQ4UWKPiu8Q7sh?=
 =?us-ascii?Q?KOthiyXvRrZgKn0MgY+7ndclxFhS5avDVCucRX00CZq7CnHjqrkVxV0IFeH/?=
 =?us-ascii?Q?APWEZ+9MWy7IGqtojLAyrb2xCFBTDVoe7fAgB4e5AZWoDHc38j0z8oSrfedb?=
 =?us-ascii?Q?ObhSg0F2abWLmCQBtf03eW5xFrAP898H+W9AnFwQdTiaQkouWZfGOTn7gSsA?=
 =?us-ascii?Q?6SfCOjniUt3PT6gQwHiS23sXRmpZZkYiuJlkeOWG3n3fgFa1f5vHqJ8aa5is?=
 =?us-ascii?Q?Iql9NkLTP+ACCl+nJPiGVoiqqAe11vnTD+XMukk3BKr60tTATJLIefburoLm?=
 =?us-ascii?Q?1WD2Ww0w01d9u1BgGoqVId/UVtlllZEw8EPsCocYDjKe6vTIsUb1VoxVVQmu?=
 =?us-ascii?Q?CbAmtx+K3vpOvqeQanpipsV9KN5s4ZGp5KqBUSceikb9V34eTaGZwHJRY1o8?=
 =?us-ascii?Q?D4UAumKN6twHjLIlHGZ72OXYcNOvF0sawolR4VSLznCjI5VuBQ7FUv9iKPvN?=
 =?us-ascii?Q?85FlBbjN0X80/WHcOOkDy4mpSbArK1iagtPCKIHV27hdpOfEkSGZAHFKJ3re?=
 =?us-ascii?Q?aC8vkedx43a+iPnPodfYfodkWbtLCyzEvwUrcnYYiep8/YAI2YOvrDvFRCB/?=
 =?us-ascii?Q?GkyJAy1UpjGBKTuDVmAtabDyVdru4AevEOamZYzhaehkDyCOaKcKGp8nev3X?=
 =?us-ascii?Q?iIbHfHBu0I9XzSntE5JEdxxDTWDKa9SLhACCnimhczj5b1FNgT4aYbQsmL2d?=
 =?us-ascii?Q?mEEbhTg4GAiStHhOy77u1y1NVlL+CZKej22AyBIFOgZwcdZ4cZSpuHa8POv1?=
 =?us-ascii?Q?xXTzIjvhZMPk+DL5RzHu7onpL5yODpKGdF5jGJQqf8zAhQDWKEgQ6N+5h3gk?=
 =?us-ascii?Q?ojwXNGBrGIahrAvTeNToQqh88tT+Uyu+pUEzNW8l?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r9Yt3RTgQlv0l3JLflmLYL5igdnvQ2/fyNiScmnGrpEpsR4BDNF08XfbgbH4?=
 =?us-ascii?Q?q6GbNAMeVW8mhwrHR/DYfSQrGLfMgkIvqIus+v2N5tXXO/gF/owUKBJn7dxH?=
 =?us-ascii?Q?3mFQBJRQLdQvCOawklBJM+W+7SGmoRVd4fuTqV1lVCchVtyWU1cq4Njs43nX?=
 =?us-ascii?Q?CLN0G+tD0ZVwRmrzvKYnMB4INRxJLEc+0bR2E+kc7bktTrdjmBEsxF2d9ePP?=
 =?us-ascii?Q?2ZoM+fVQbIcUXP0dEEKZjq/rmixOg8LIwcxF28Rx6dSBExgcrtQ3wl+5ejN4?=
 =?us-ascii?Q?VI898mC4og7JcUL0Ele2aMNEUzZln+e3dDAmcykD+/1kfZbgQbBRlnHUw/t1?=
 =?us-ascii?Q?kOsNGbzU8A76tO2C02RdCmkOIvKn3LQ64sgnf979kyBTRAH9sZvcSa4CC+Yp?=
 =?us-ascii?Q?+6s0TMhuxI9numhs19jRZmk0Zr49v9jWipeauH6cFZ4dzTRnO1sehrHPNYUW?=
 =?us-ascii?Q?z5xPeLnXh0jcOJF54xMyHOhw/Tja27TOp6ONg5Qq2UBUgZpoDUm7rd5Y98Z2?=
 =?us-ascii?Q?bm4Npd1ir79Ya8aahaNHdf1ns7He8tgXpngS0jAqiBOa++tlxJRuDvdWS4Ca?=
 =?us-ascii?Q?nO8qWtN3TkRM7c+watF54GDsS7w6adpYB0LfsKA0Iw+ZJ4dmVgmYC8GUmnvt?=
 =?us-ascii?Q?HTfI4T29HVBUHByqEE6fz4PGLk2EPRwEuU/hCD1jooKBaU8uGQ+n7n9Cbb2f?=
 =?us-ascii?Q?pqlGNcttt3/rPhKjlo2WHLnhywFPGRL67YpnYB/7ukzOar4yc3NPL4REqlW4?=
 =?us-ascii?Q?TQKJWDWjMMbe3N9SerMzeg8a9Nxuu3vSHPYgs9xg9rls13JQGhAKFq5+4JkE?=
 =?us-ascii?Q?rvC/k/6Nk2kQYWv3y3NwG2R96aF0sS231pCcrgL2cvyeny3pVNgIBI+fs6nG?=
 =?us-ascii?Q?yBDuOC4H4EzkdH+jnDRXlgXF5MoXk64KyKXmnGJPHes1fgzHXLE7v8HXpot1?=
 =?us-ascii?Q?kaiITWEg27I/TqR0aypD2iEmBt1DeXzeEzD/nWXMThOBbSiD02ftdrKSgumj?=
 =?us-ascii?Q?xbIwXPa1RLpTTLqgau00VOx8CjCyun3IjkUdgFnk+NGn7AKlJqk+TEV6vBTv?=
 =?us-ascii?Q?JlYJlPEckp0CavvVhjf7hllncVSVffAltA1ge0eTA/bv7ut7JnkvQw1x+8To?=
 =?us-ascii?Q?74eOAE+s3m9SZRI/mMP6v3mVeVVS94EYjSs32QW2uzEi2xYVi3ruQj/f2J1T?=
 =?us-ascii?Q?qDi27t3+dkv65rideyiZERu7Zi0krABJXaiXiRdbQWR6tjwvHpsEEv/+rl3x?=
 =?us-ascii?Q?IZa1fONfSDgM4YHlwZA8zS23KzZ5061oO5Mn/1XG7NK0/kQc57184w8SUO+T?=
 =?us-ascii?Q?QfhErYblLX5GyNTgl3Zz0c8Wz5T3Wc0Q3C0lFR/NDh8eW/6p1rUl3o55hSnd?=
 =?us-ascii?Q?jW10ExOoBJMsQqGTxpeWeoL/KCwxu/buxoZPB+KLXQ/jpeE3Pctbq+NAHTRR?=
 =?us-ascii?Q?jxX0qZrd4lIE8SLbozMuDTFELhLOMqpJGayryO90hD1ZLMkL/fILpsDDJ3HX?=
 =?us-ascii?Q?T2RyLUt3jeaGLHxmrBaqw4RFhy89nQWKf8xKm+RQ7S5YMsQzkjmWkuqx55xi?=
 =?us-ascii?Q?DcjQH6OfSlpTQZp9qXB++WKh4CoZEDCQI4Z8wvorj6CyByiYY8AX9GodDYYr?=
 =?us-ascii?Q?JgDaX+2oIwV64ypAUHahwunXRC8LlaWkDa9FoY5aQLbSKJRkdnCHLE6PLqq1?=
 =?us-ascii?Q?RQp3dEu7ItA/Dx/bQ5SXnhFXDYIYHM6+OXncCCQMcjUxWeGw4e/GbBy6p/de?=
 =?us-ascii?Q?3GLNKyG7GQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	S/9gchjZ1Pht4NEe2yMpXTXgg8XO9pOCb78xg3bfH+0QLWJnZX6+dYTUDxnVeb+ZLRCDCcqtJ7gBXonVfJjuvJdJW+Anzr66Jilvmgx+QWxv7bDMZA2YySuVqzbVNrt34W6xEqGdbQHk6f9QIc/T7BjA5ZLlnLT+8jXgBbDGEhrBsQ9T5z+G4qN4qgg9OxoI0W9oq7WUYFLlUHXyt7B+v+O2ZFlBXD6fi27t5JYU4YnFOr9TdpajLD//E0Z9Gznlbsj1jfJSl98liQqZP29ezcTgvzlrNfUYO4fFUS5tMR1Z7tE1hNgmZmzDhIcYxEGCX7ziLisLJ/JSNikwPhxWxoGBI7Ji7IsPDGzouLxgTPtpPDH4XzzMAjZK/KxFyNQULJm1G4KAaUHA1vqoq4Z0NoRs0Q6qLuVOS4oxff98OaoFul2THIY6Rbuf+UzBfXnVsGU6xIJ0iGj1JAVoySdikkw8C1HNA+4gXVoBvTTYApx7MqmF5/7VdnczPUJGtt1LEsMUKfL67ZysiAeDrZMeQKs3KWSEyZIkn8QyAPhLXQy+IKJOkmV40jFCwklmv+Rw6CkINNlY8oboiwh0gZ9uFZUIBlFCuOkhZmBWlOXjvJ8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f8c466c-814f-4458-c08d-08de5483f95e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 22:18:13.5788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +/KFCxSmlSNK/bCmr6bbkCL3Sp18dutmf0/P8U5JFnEXWUrvKwah6ucm+Ymgv5NJMMNgucsCYhpJsfb8VwJ9OB+5KSEb2KoDOTyW66pJMUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5577
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 spamscore=0 adultscore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601150176
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE3NSBTYWx0ZWRfX7NM0WiR74Qag
 Lx18BqzGZmJs9sBaBbAmWj0t+7AYOMoUxWlqwzzF1/gmOm3Wl5T3AIv8dc3pUm4MVkLJE+jjU3V
 75ALjXpPTPktdG6pkgJHdM3SWG6pu2V/muKZ6+CPMWwwfE+6W7j9x8Vyg0HlDA6Ip3RzcNHNnZ3
 UDuqLNwUQyhIcw5fmuUO2iROZhDLpl4QQgwphhV7fYaRP7F0ceDM0gPyK0p7gwoZSqI0qEp6y7q
 5lrrbPbTwRj2LzHQP6+vv/G9HxjnpJxfHnatUFSrnD5RU2Gu5ahKebzwRVGQ/EjC9QSDNI4+R/d
 /Jz06nY/t7q3WqKnjV51tBp5pH9v1km5XbBvp9YtFNvQbZOCm4/ne4jT/+qwKbPhNNMVzWfIEqN
 5uHN2TvD1gd0F151uD3S2tkNuXJoovlCNc2pdEHBjhHjuszj9/RJaDCQVKZQoRtzdIaaqfgcQ/o
 nrOE0+ivscvu9sTBxsy8unobqSXQw7s4mIJloaCQ=
X-Proofpoint-GUID: tFghnaxNMbPo9XjwLBmG3RgZv2jGRbEc
X-Authority-Analysis: v=2.4 cv=aZtsXBot c=1 sm=1 tr=0 ts=696967ab b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=VydAl2ixoEANyGNhwjoA:9 a=CjuIK1q_8ugA:10 cc=ntf
 awl=host:12110
X-Proofpoint-ORIG-GUID: tFghnaxNMbPo9XjwLBmG3RgZv2jGRbEc

On Tue, Jan 13, 2026 at 04:42:05PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The char array prvname[] is set for each provider.  It is used in the
> file that implements the provider.  It might also be passed to
> dt_sdt_populate() via a function argument.
> 
> However, dt_provider_tp.h also defines the macro GROUP_DATA in terms of
> prvname.  In turn, GROUP_DATA is used not only in dt_prov_dtrace.c but
> then again in dt_prov_fbt.c to define FBT_GROUP_DATA.
> 
> In commit 0b7c5a632 ("fbt, rawfbt: consolidate code to avoid duplication"),
> the fbt and rawfbt providers are combined into a single file.  Thus, two
> uses of prvname collide.  The in-file collisions get resolved, but the
> cascade of macro definitions does not:  FBT_GROUP_DATA ends up using
> "fbt" for both fbt and rawfbt providers.  As a result, it is possible
> for rawfbt probes not to be seen.
> 
> Notice that GROUP_DATA is always paired with prp->desc->prb.  Therefore,
> simply replace:
>     -#define GROUP_DATA     getpid(), prvname
>     +#define PROBE_DATA     getpid(), prp->desc->prv, prp->desc->prb
> This makes the code more compact and relieves the macro definitions from
> needing prvname.  It also makes the FBT_GROUP_DATA macro unnecessary.
> 
> The format (FMT) macro is similarly renamed and redefined to include the
> probe info.
> 
> Add a test to check that a rawfbt probe can be found behind an fbt probe
> when the probe description has a wildcard provider.
> 
> Orabug: 38842114
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_prov_dtrace.c                    | 14 ++++++-------
>  libdtrace/dt_prov_fbt.c                       | 13 ++++++------
>  libdtrace/dt_prov_rawtp.c                     |  4 ++--
>  libdtrace/dt_prov_sdt.c                       |  4 ++--
>  libdtrace/dt_provider_tp.h                    | 12 +++++------
>  .../providers/rawfbt/tst.wildcard-provider.d  | 20 +++++++++++++++++++
>  .../providers/rawfbt/tst.wildcard-provider.r  |  2 ++
>  7 files changed, 45 insertions(+), 24 deletions(-)
>  create mode 100644 test/unittest/providers/rawfbt/tst.wildcard-provider.d
>  create mode 100644 test/unittest/providers/rawfbt/tst.wildcard-provider.r
> 
> diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
> index 34b5d8e24..102afd84e 100644
> --- a/libdtrace/dt_prov_dtrace.c
> +++ b/libdtrace/dt_prov_dtrace.c
> @@ -243,8 +243,8 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>  		/* add a uprobe */
>  		fd = open(UPROBE_EVENTS, O_WRONLY | O_APPEND);
>  		if (fd != -1) {
> -			rc = dprintf(fd, "p:" GROUP_FMT "/%s %s\n",
> -				     GROUP_DATA, prp->desc->prb, spec);
> +			rc = dprintf(fd, "p:" PROBE_FMT " %s\n",
> +				     PROBE_DATA, spec);
>  			close(fd);
>  		}
>  		free(spec);
> @@ -252,14 +252,14 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>  			return -ENOENT;
>  
>  		/* open format file */
> -		len = snprintf(NULL, 0, "%s" GROUP_FMT "/%s/format",
> -			       EVENTSFS, GROUP_DATA, prp->desc->prb) + 1;
> +		len = snprintf(NULL, 0, "%s" PROBE_FMT "/format",
> +			       EVENTSFS, PROBE_DATA) + 1;
>  		fn = dt_alloc(dtp, len);
>  		if (fn == NULL)
>  			return -ENOENT;
>  
> -		snprintf(fn, len, "%s" GROUP_FMT "/%s/format",
> -			 EVENTSFS, GROUP_DATA, prp->desc->prb);
> +		snprintf(fn, len, "%s" PROBE_FMT "/format",
> +			 EVENTSFS, PROBE_DATA);

How about also changing this to use asprintf() rather than doing the douoble
snprintf (one to get the langth, the alloc, and then actually populate).

>  		f = fopen(fn, "r");
>  		dt_free(dtp, fn);
>  		if (f == NULL)
> @@ -300,7 +300,7 @@ static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
>  	if (fd == -1)
>  		return;
>  
> -	dprintf(fd, "-:" GROUP_FMT "/%s\n", GROUP_DATA, prp->desc->prb);
> +	dprintf(fd, "-:" PROBE_FMT "\n", PROBE_DATA);
>  	close(fd);
>  }
>  
> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> index 3feac56ea..8dbf9740a 100644
> --- a/libdtrace/dt_prov_fbt.c
> +++ b/libdtrace/dt_prov_fbt.c
> @@ -53,8 +53,7 @@ static const char		prvname[] = "fbt";
>  
>  #define KPROBE_EVENTS		TRACEFS "kprobe_events"
>  
> -#define FBT_GROUP_FMT		GROUP_FMT "_%s"
> -#define FBT_GROUP_DATA		GROUP_DATA, prp->desc->prb
> +#define FBT_PROBE_FMT		"dt_%d_%s_%s"
>  
>  static const dtrace_pattr_t	pattr = {
>  { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_COMMON },
> @@ -508,16 +507,16 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>  		if (fd == -1)
>  			goto out;
>  
> -		rc = dprintf(fd, "%c:" FBT_GROUP_FMT "/%s %s\n",
> +		rc = dprintf(fd, "%c:" FBT_PROBE_FMT "/%s %s\n",
>  			     prp->desc->prb[0] == 'e' ? 'p' : 'r',
> -			     FBT_GROUP_DATA, tpn, fun);
> +			     PROBE_DATA, tpn, fun);
>  		close(fd);
>  		if (rc == -1)
>  			goto out;
>  
>  		/* create format file name */
> -		if (asprintf(&fn, "%s" FBT_GROUP_FMT "/%s/format", EVENTSFS,
> -			     FBT_GROUP_DATA, tpn) == -1)
> +		if (asprintf(&fn, "%s" FBT_PROBE_FMT "/%s/format", EVENTSFS,
> +			     PROBE_DATA, tpn) == -1)
>  			goto out;
>  
>  		/* open format file */
> @@ -583,7 +582,7 @@ static void kprobe_detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
>  		}
>  	}
>  
> -	dprintf(fd, "-:" FBT_GROUP_FMT "/%s\n", FBT_GROUP_DATA, tpn);
> +	dprintf(fd, "-:" FBT_PROBE_FMT "/%s\n", PROBE_DATA, tpn);
>  	close(fd);
>  
>  	if (tpn != prp->desc->fun)
> diff --git a/libdtrace/dt_prov_rawtp.c b/libdtrace/dt_prov_rawtp.c
> index 709f7040f..e3269f4b3 100644
> --- a/libdtrace/dt_prov_rawtp.c
> +++ b/libdtrace/dt_prov_rawtp.c
> @@ -56,7 +56,7 @@ static const dtrace_pattr_t	pattr = {
>  /*
>   * The PROBE_LIST file lists all tracepoints in a <group>:<name> format.
>   * We need to ignore these groups:
> - *   - GROUP_FMT (created by DTrace processes)
> + *   - PROBE_SFMT
>   *   - kprobes and uprobes
>   *   - syscalls (handled by a different provider)
>   *   - pid and usdt probes (ditto)
> @@ -89,7 +89,7 @@ static int populate(dtrace_hdl_t *dtp)
>  
>  			*p++ = '\0';
>  
> -			if (sscanf(buf, GROUP_SFMT, &dummy, &str) == 2) {
> +			if (sscanf(buf, PROBE_SFMT, &dummy, &str) == 2) {
>  				free(str);
>  				continue;
>  			}
> diff --git a/libdtrace/dt_prov_sdt.c b/libdtrace/dt_prov_sdt.c
> index 74555f5be..ee2cc3c27 100644
> --- a/libdtrace/dt_prov_sdt.c
> +++ b/libdtrace/dt_prov_sdt.c
> @@ -54,7 +54,7 @@ static const dtrace_pattr_t	pattr = {
>  /*
>   * The PROBE_LIST file lists all tracepoints in a <group>:<name> format.
>   * We need to ignore these groups:
> - *   - GROUP_FMT (created by DTrace processes)
> + *   - PROBE_SFMT
>   *   - kprobes and uprobes
>   *   - syscalls (handled by a different provider)
>   *   - pid and usdt probes (ditto)
> @@ -87,7 +87,7 @@ static int populate(dtrace_hdl_t *dtp)
>  
>  			*p++ = '\0';
>  
> -			if (sscanf(buf, GROUP_SFMT, &dummy, &str) == 2) {
> +			if (sscanf(buf, PROBE_SFMT, &dummy, &str) == 2) {
>  				free(str);
>  				continue;
>  			}
> diff --git a/libdtrace/dt_provider_tp.h b/libdtrace/dt_provider_tp.h
> index f131b1e02..406609d1b 100644
> --- a/libdtrace/dt_provider_tp.h
> +++ b/libdtrace/dt_provider_tp.h
> @@ -18,13 +18,13 @@ extern "C" {
>   * Tracepoint group naming format for DTrace providers.  Providers may append
>   * to this format string as needed.
>   *
> - * GROUP_DATA provides the necessary data items to populate the format string
> - * (PID of the dtrace process and the provider name).  GROUP_SFMT is like
> - * GROUP_FMT, but for sscanf().
> + * PROBE_DATA provides the necessary data items to populate the format string.
> + * PROBE_FMT formats that data.
> + * PROBE_SFMT is a format string for recognizing PROBE_FMT data in sscanf().
>   */
> -#define GROUP_FMT	"dt_%d_%s"
> -#define GROUP_SFMT	"dt_%d_%ms"
> -#define GROUP_DATA	getpid(), prvname
> +#define PROBE_DATA	getpid(), prp->desc->prv, prp->desc->prb
> +#define PROBE_FMT	"dt_%d_%s/%s"
> +#define PROBE_SFMT	"dt_%d_%ms"
>  
>  typedef struct tp_probe tp_probe_t;
>  
> diff --git a/test/unittest/providers/rawfbt/tst.wildcard-provider.d b/test/unittest/providers/rawfbt/tst.wildcard-provider.d
> new file mode 100644
> index 000000000..ad9f4c779
> --- /dev/null
> +++ b/test/unittest/providers/rawfbt/tst.wildcard-provider.d
> @@ -0,0 +1,20 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: rawfbt probes can be found even when a wildcard provider
> + * description also allows fbt probes.
> + */
> +
> +#pragma D option quiet
> +
> +BEGIN,
> +*fbt:vmlinux:do_sys_open*:entry
> +{
> +	printf("success\n");
> +	exit(0);
> +}

I am confused how this test accomplishes verification of the assertion.  If
a regular FBT probe satisfies the probe description, wouldn't this pass also?
Wouldn't a -l based test be better here, where you can test that the output
does indeed report both the fbt probe and the rawfbt probe that match?

> diff --git a/test/unittest/providers/rawfbt/tst.wildcard-provider.r b/test/unittest/providers/rawfbt/tst.wildcard-provider.r
> new file mode 100644
> index 000000000..b34a52d2f
> --- /dev/null
> +++ b/test/unittest/providers/rawfbt/tst.wildcard-provider.r
> @@ -0,0 +1,2 @@
> +success
> +
> -- 
> 2.47.3
> 
