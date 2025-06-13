Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DF718EFD1
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749825743; cv=fail; b=M1puuVoH2nXzn3JrH042XQISNC7Cc8fZ7NKYI2DtJxZ35I8FYsBERdiziEaXC78MORrG/L9vbYzzBzu+30EGMgYw29kBbVemSVgS1O8gkMzdIGp21sdtqmiYwmD81wv7Sw/XpgT0/PFgZ7md3PpY0oQ/J3bkpTCO7VxhCAdRPvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749825743; c=relaxed/simple;
	bh=FViOi3GlvikrXnBG1P8PjvEu+C2swZkjO9B64JS12Gg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=Vf+dn6EqLT/NPr//caTYdb56xZWTXRCdxTIidBvXYqQ3Som/jE+Jp7YQXLBsMFjR6Iel+e9zB9JoLm8RP0QjOzt2Zpq4trw5KtX+D1VX1paqBAji0txuN6039WYgKPLtIGFUJHBmesRuo+WRS34STWGjSR7cksEIKneVRKmNDYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AG6H0M1K; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mHR030gd; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AG6H0M1K";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mHR030gd"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DCtZ09009400
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=wOT6V07gkp9jnTZqF6
	CNESwUJgohJmUoQofnHpP8jPU=; b=AG6H0M1KcYeqGOOqkcb7VgBBReNQRSfbUS
	FiK7O9NAnziztvaI0tZv0WemDhyzF33j+WOtK96xu9keB0bBLoN8lQc4qtqbWqmN
	0KIw3YbTvgEjLMddbtyzNb3d2wMR+qXE2dMCHND9Q6UNIhGx7/8bKFFYqjUzrVFA
	NSsKUD/bsQH1RyhXBIeZv3wYIAiLIbCyGl8eujNEAQdPziF1wD2v0vv5RQUB0Jwn
	DO9h0FKupqng38+6wLBhgi2UddhobWG9ZdDEZuaGTTuUjhaZRMDMO9me5GGln/f2
	BYI5x6hmMTSJY6SouYpIEb2l4K92GigI8TEJ1ivDbKsL2o6xbRlA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4752xk35w7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:42:20 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55DEOwCP009293
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:42:19 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvdq6ns-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:42:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OOrd/UKQpYqxkYPSzlSeOmnNVB3R7afpeMM+tVLQlFXL2gxR2RoUC5PgVomGzJfcW2IACTwBfCylSsXbNDUamM2sZtaGfX2eajYE2G+A/Flbk9J0FP41XsLa+ckdeQGDFC3GJCj0sxZQDcFAYnly0Y6TVandfuukHEW8+6RHoQBulnRD5AJYVWeABIQF5BGybPxBT9ezquwtg4ZWv4veQBfHpPPD2Zt7p4AOaaB/j/uhUGbVMzWYcY6MMmp4Q19MOUrOPScCvFuNn0FKUbbOJt145zjQJcAtXfBoWIeRzYUCwIBpLkq5hZ+0uRtlErg4HDxWhgAAw2Erv1qfS8HfDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOT6V07gkp9jnTZqF6CNESwUJgohJmUoQofnHpP8jPU=;
 b=tCcPL+IXqsMaC37St/5wy1wlo6Qzb3iL5RtH8WShRGZtn08bnDRh6T1aOEh+Z1QE8HXyaxZEBMMiT1GEcrpNgHdeL0gV0seUrvDPqxBdHgX7kDGdvFnfcMb8cjKypGFtNg9EIhjwcZ4ShbJAJMS5Qx/ZqDTuMWiHTiGg6fnvcgAlhDUhDU9gG9uE5acKRybGX2OA4nfxB44lQF9R9lp7xDe8G8VO9XRpAXRTMlwckpf1bEYqQToFi9As7ZpXn0fXez+L13wM6d1Gquua44F7nxnUVbIO5oowv0CxivumCsh4STeJOAiAISZY0azVRuWggtppc+XcFqy78vfQ//UeqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOT6V07gkp9jnTZqF6CNESwUJgohJmUoQofnHpP8jPU=;
 b=mHR030gd1ivMyhD2huks8xUAeONSdT+3W6ZXeDC5zwETBcLGuGLDM2qzqC0/5O3cLcwmLPuxYsUE5xfAP6Kt4gWAuRScB49nqfGlo+/HqbYLt23gemsdu5a5xJ1hYQ3aoo8K9B+901muhaYfB0FcCR4B99QoArrrptX3tNL9O9Q=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by MN0PR10MB6006.namprd10.prod.outlook.com (2603:10b6:208:3ca::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.33; Fri, 13 Jun
 2025 14:42:16 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 14:42:16 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 05/14] Test: caller and stackdepth tests for dtrace
 provider
References: <20250522180118.27343-1-eugene.loh@oracle.com>
	<20250522180118.27343-5-eugene.loh@oracle.com>
Emacs: it's not slow --- it's stately.
Date: Fri, 13 Jun 2025 15:42:12 +0100
In-Reply-To: <20250522180118.27343-5-eugene.loh@oracle.com> (eugene loh's
	message of "Thu, 22 May 2025 14:01:09 -0400")
Message-ID: <878qlvd7p7.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0013.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::19) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|MN0PR10MB6006:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ea3c755-47b6-4b1f-5ba1-08ddaa887e00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y7olNKD4ybM+sTXxcyp9MgA8KnlfyKiWP6lNJB9PFIpdR3hSoH7z6ESR48vL?=
 =?us-ascii?Q?Jfy3KJeZsDErMhspsoiUL2SesAf25z0ruP5YGh+6ugNzBCYhfSzV4c4nLRzH?=
 =?us-ascii?Q?V9wjPbzn9RTewLYrzN0xFKIu+Wo25IK59ckkP0TEGendmB7S5ki1EZ9OucIY?=
 =?us-ascii?Q?MzI9ePsHSR8O7+IaJm3zLeIFerPn0aFCJ6J9XLrsE8A6MwDV2Ih9QiN7F3Og?=
 =?us-ascii?Q?80fyFZ2CUVnv+UeRbtizgRvl+PkieUnq/unxu2BQmCkvkUAVdyA/WJPxa15v?=
 =?us-ascii?Q?Nx5HwhHq4CEETOh8+O4xMfclrWHohZ2q6UZ/AHEbs0Ifw3MWYsaTwg4RCDj7?=
 =?us-ascii?Q?gINtfS+xtGZo0xFXLszwSy6PTBUQyz6WAEnz2fpGTwhxKi1VmiOLK3UYYSZq?=
 =?us-ascii?Q?z6EIzlq5eDutKfgo3xPpk0YpSEokWzK3YDoGU6+sej39jnaKkar+ih6232aw?=
 =?us-ascii?Q?il8gHC7XzCmuem7jIiHXGvfV/ICgj2p375g5Og/wUuaLv7QIs63pvFtgTjlQ?=
 =?us-ascii?Q?nCc3gaWwlSCyosQ5AmARCClurMi/e1yK56brSHlBFAw0YzTKkz1cJmZMLo9Y?=
 =?us-ascii?Q?M+Kwe6nJNxnO/p7Si3I7W3sC0twZxX2ob04k6ZyFV+LRFVhZMtIfV4SUoBwH?=
 =?us-ascii?Q?pKWEQLzYZJTejRNwsJ1TZnOporxBVggG/tvccJFIRtzX7nuYP6an9ZYd2gJa?=
 =?us-ascii?Q?Xv3qe/8KZAtHM5s23LSNIyBKYf/EQbx2fPyh+li1O13STtSctFahjAVpveQc?=
 =?us-ascii?Q?d9ni5qDQofmzWkCNvgaQNOg6rPLV4QKWJ7DV1Dfssy6KuEk74tCBZOG/70Tx?=
 =?us-ascii?Q?Qsv9fbJvMVaIxD1C0wn5V25vqvNZQvfFiwZmJgjSP/RIPPXEtnnrY6vITD6A?=
 =?us-ascii?Q?zthRld/RmbOhHNfxjQpz+IX+ryQ2b4ECD3rPpWeeB3O5qnnsiWORLNH61RVN?=
 =?us-ascii?Q?dxk3MMgc6rjv5JDmcxkbDZ4k8UlJ/sE9p8esRdw6AUxT5tgIoCPU1vlM10NY?=
 =?us-ascii?Q?30uOmgRYQ2vuPzulJMKwTOvaPZjW8+JMHta6m2LKmVLhoASx9/2rE3FYbdGl?=
 =?us-ascii?Q?bUUv2fA5rRCcTIc/u3BtYnSMTBXoV1pr6aZIc01X7YnX5MXlNxDUsQp7H5v0?=
 =?us-ascii?Q?aMh0gGnBeX1b6zWpUBNyupZNLnHLKCXagObheG597CPlSt9Ff/Xv8Bn1ZiGV?=
 =?us-ascii?Q?tZjv05IZTqarQc59yEzkCTyhwiA5APwK6OgdmKiXuDtP9QRcEjquoe6x0udd?=
 =?us-ascii?Q?UuPGsp1hXCaOOVsOH0nLbE+Q99FqVMGa44rBvh6us6iDT+66US5Uxt06dqqh?=
 =?us-ascii?Q?EjOUE7VkOAmwG+FXSptQiVInC5lqe/2DjiUQRsO6tMFTfZp9XPMTVGRUMI64?=
 =?us-ascii?Q?b1Is6X54Jkrh545t5Rrr2NUbw1l1G5Y4dckHRw1+appr5grRmvCMuId0blzP?=
 =?us-ascii?Q?g3wRk72gIRs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3s8M16E1Xqsh83wXMG1NMBV7s2+tVzoLzVItEwAfaaSnQbI1BrpY4/SkLegw?=
 =?us-ascii?Q?XfKLgLLFr5+2gK2wwPExQBdFjRn8UWqv2ow1eOCDexGSOvse1A1jcL8Uk0K1?=
 =?us-ascii?Q?eW/1ZST2BNJzR1Tg93branl6J//+I3xV2P0q+Qmo49NF0CvRhOMxuhsjY3B8?=
 =?us-ascii?Q?hLcfgVOkVrEmVfo3qcvUG4nPUsajbE6pYZe93V1WFo13i+8yNZ1unR0FRdqR?=
 =?us-ascii?Q?GXqMR1AKA1oU+epJlPGfgBTsixFDtH3kLTrxAl3/hTbLNOjLKUubN1bHm42k?=
 =?us-ascii?Q?cSKAUf98pt4o+OEDVOMiots9ldMNDE1Tg8KGHOGJ1K2DVSlfZ0qxYpDHB0bR?=
 =?us-ascii?Q?yo6/6XmagOMwsX7D9QC5SCBvUxkgXV7Nit6CwFQtRIP8t9wvwaLnAucCAxq5?=
 =?us-ascii?Q?kGK8wnAHbE6/n+BVcUkPgNF89bdzSRo0XJOM+Yqgp3U4Bzx57WLgq+XrMp2+?=
 =?us-ascii?Q?45SW4t15ZeD8sa01xZbGDHi0MGiRWp6J2N6Ve3xXwjKzZg50LE2y1Ti+gIiu?=
 =?us-ascii?Q?71fZIx6vdgHzqiJSMFWOXBGw83mOsf/2nGxRhufKG2d6bfz5HBLbABdUYfX9?=
 =?us-ascii?Q?z8jS6Yp8KhRIOfavraUHVWM4DWsdLyngNiuBYBf3PNXqjaMv3lE4R4nr2Nid?=
 =?us-ascii?Q?gMReSy0WkT2DidxKmFrDMudeBkBqB5N7INwpS+HgSRvgIOdBnbveq7nF7gRL?=
 =?us-ascii?Q?YxRlER3YfN5+xIrdGn9PEHClK8FHYaLD6xAuGUoLYND6l87nJkL2MGaS4mQF?=
 =?us-ascii?Q?05Ls+VA3glZVLPKNM6t3FXB6JpVVQZK8ILKvQF0K3WSnR2u6hKDfmwz9VFrH?=
 =?us-ascii?Q?D4NL1dsE975eUaT2VJhEI71FTs7i4fF7nVgjGl+2Vs9JmtIr8FBkFeDMZln5?=
 =?us-ascii?Q?gl8cnnN/H0wFTSj3Os6IeLrP3quEU6UmRD1nj+BsTZwdflgtMCh7WKxebI4F?=
 =?us-ascii?Q?4KPpgbV6LmzF58rFe/KcnALDgSs49VMXKyNuTl5JYe67aQyQv9SgKP/npZbk?=
 =?us-ascii?Q?WUpOlhQ3aBMOJKdNz+6hq9amHjICdP/apQom3B1GAtCcoEbPasd5RYJVj8E6?=
 =?us-ascii?Q?FuNucoKPFO7VMoug62QY8O0+RtFbXxc1Imf6TaPHdmWakwbwgVbrcIIU1ZBc?=
 =?us-ascii?Q?q7NhDmUY2mr4DBTtSrKiKrc5votA2hW81ZLqbEaGi2rsaD4RG9LhgWLK9KU2?=
 =?us-ascii?Q?8mtgGkx3a1x8ZF5bZIoBy6GI9RIL0oA2gEn/w1gi+EIwZzmAvUJbOi2WRdQm?=
 =?us-ascii?Q?CFyOlaR84SD7yuJq0LPLdPKjFg5MR8M+audsU+EGw/3UQ6DhwHGQ5h3RwUml?=
 =?us-ascii?Q?dNicvw3sMU9FrgVbmh3QVXn0et3rDXuVetzZsQntMko+8ve7UPxFIsczvdXZ?=
 =?us-ascii?Q?SzNxMeMMMfZ+AXOsheU7fqvb09REj03+o1Le3uy2Eny/7+C7gYtLIEAUgIFr?=
 =?us-ascii?Q?mX/X+Ft0GmR+mQegV4OGi9dY7nqg/26TPGa9FB9c1lbx2myliEf1iuAtXMsL?=
 =?us-ascii?Q?EIM9/rHC7skMJQJESsh8jS3N5tLPA+8+h5M2onx/XZT2+4xb42IoFsC/d+kA?=
 =?us-ascii?Q?ukxPBTVnsadppVu8aUVBftxejfI/ddmYx19kvWNeSG0erfKRv900IgJytNgS?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JVQfUaVQU9mEv4+Lz/pf2YDqvtaJB08B/xHbS6urORfPNNbD328qEK+NVKN4w4FOpb80puJpKc6U91uQurhwbBZl2ZCxQ/lwQT76fHj6lBOSJ5O4L41xP+NacsS1W3wDxwjWfSjuWKXxfVIkc5MJ3H7/pCMeWc3zg52iKb89jaMgooB29rRAIYbLTGMQW2z6cSErK6QNi18I3+zO/WTqQq/LT/yM5nFdiGWRqbCruvDLJIGT03Hm/CwiB2Em6NQHYdDlxttll46WlwxP01GiJQzCR9WY63p++NfZtyrbwFaAdw4U1Uhbw/JICoYJNNjk8twBYcY4c6CQSTmpe3fhrs0t60I6ywt33ueFTBbQpJOyJaf0aW1Rn9GYrn5KUTFPXNVjzZiRe8l5IAf0cOyS/lIAA7avjJzj2n+1CeW5YCRvJWmgOiCPnK4RqoGm1qkpkkkfGPNp+odEMGjuVAT1j1Nk5wSgGKMVNP4sHYATeHit0N6UIHJeMtgFQFhuxu/kRRQOeMO9Kjv1CBYOVjOJSbgYUxsEjk81hsPXXxkQgzEc84u5cG7c7D8CxUrUpBmfuSBhV8+t6JNK7142SCJdOexfOYzUL7FIs7IV4gLUDTM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ea3c755-47b6-4b1f-5ba1-08ddaa887e00
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:42:16.3975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iY6Udt+6Yz1pdwWgR35g7iVBIG75/Sp8L8j614LfDw5ZbwLpiS4PiQb9hN3FcBw9hYbjwHHS+4u64/pD7CMUAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB6006
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506130106
X-Authority-Analysis: v=2.4 cv=K4AiHzWI c=1 sm=1 tr=0 ts=684c38cc b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Pd96YtAAmMkcmEVqtigA:9 a=zgiPjhLxNE0A:10 cc=ntf awl=host:13206
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwNiBTYWx0ZWRfX7sAbfOGazge9 hc8gGTDAR/veOD1oW15ofCi7gBJGLFmUQUhLWpFoxWCs2RgRsIC4ne3JAKDq8CXaMB4ay8X0QPn ceT1iE4ClbPwqSzar3sORph+c0ea8Rp28LcUTx39cirmHSOmlWFHF5UXhlWVjCwcbwhD8kFk6g9
 zeVy3BUxG7S50dXLMnxTWN0KxvCwWJh8zvP/BNUVPMBPDkcATE0ncKTuGJeztmVTKywfoDKXZ19 5ZjzMh5+mksAyXaoNd/hPbF0b/V45PfXEjwUqYgGcXwYWe6V0PHl6lslGr1Tka0GlDnUwbiJTqu 3gfN40in2UR+RTfXRv0lnH7y9n+WKd2f+LkF/0WXuZy0VDvuLAcbp2X/A/IWj3iP0UMjz9+iOS0
 3sFauNIOqdSJsVNy/CvvK2FQIoSAVH8DIgtIu3Y7exbI0kYoaHyWrAong/Vt7ljDyDejc1Ps
X-Proofpoint-ORIG-GUID: PU6A1HBTIXrO-mrIki-DGm-5fEhDCa0u
X-Proofpoint-GUID: PU6A1HBTIXrO-mrIki-DGm-5fEhDCa0u

On 22 May 2025, eugene loh said:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> Also, a few old tests, which tested caller and stackdepth using the
> dtrace provider, are now superfluous given the new, provider-named
> tests.  The old tests were extremely lenient -- e.g., simply
> checking that these built-in variables were not -1, even though
> both variables are unsigned anyhow!
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

(with the same comments regarding the old tests having a description of
what they were testing, and could the new ones do the same?)

-- 
NULL && (void)
