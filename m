Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB632737FD
	for <dtrace@lists.linux.dev>; Fri,  1 Aug 2025 15:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754062587; cv=fail; b=g66cOW+xyj3P4RD8PYLyLBaF5reeRb1Nf0Sob92IVPOJkPrP7mkGCFkrt//ZxzAqRRdU1MNZkbBoPGUwV4J5IIRwtK2Q06MNLNA+8pKsKD0OmsA9oGZTzgZ41Oh7SV8OJ/JfA73QNXz3QEhsHjPM4vXCQDf2ZwDYk7Q8V1zPodU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754062587; c=relaxed/simple;
	bh=ATCRiUN1MBnA9g9oKcwARgVkChS6oCCd7LmDAW7c3NU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ayib2fCSUSzIucR0Zh6oQAlzfCEHvP855/Dwuz5jSl5ORjqd9m8jqMIArQdEYsFoaAljuCFvAp3C8ihmzxRR1bcpzxJ7JJvO49R2aJxJC9hawNRTJ1uGcSqgBrol/xwrpK2B47xrrciSVpPE5mKfqvHfgk7IeBrtjBVCtMUUDso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=O+940/Cl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=msWLJUCG; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="O+940/Cl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="msWLJUCG"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571EmwRD010293
	for <dtrace@lists.linux.dev>; Fri, 1 Aug 2025 15:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=6SPgw1Z4L3Yh9mOvnf
	pwjIx4OWNFpwM4R5E84SAjRG0=; b=O+940/Cl20XLASaie9cdd2SOxLnSBQ1mgh
	3Q0sOQ7IA6cRDUImdlBsVYuyx+/inftgx6nXMJhacHd4sUNZUAQE/P7Y0FBkD2ho
	cbL+1ETi2i+Ul9OOBRhxoMlg+F9zsN0uXwQykKE6fvbPRJVhiOd3Z99w1XTR4C9t
	qjOAkGxVwO78UwxdkAGztJKQ7enq+vIuQ2ECkr/QWilVX6y3IVKs87B9xveTxCAM
	k6YsXhM5o0AGLD0/1QIPpPAm8QuDTr9vQIFilUssqZdx13Q6UscrBNyJinr8plwT
	4IhHL3Tnyf0G3tfPd8Y3SFQA9EIuwN4Li9iMRVAyu2qgN3R/4EOQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484q736hny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 01 Aug 2025 15:36:23 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 571F9Sf8034377
	for <dtrace@lists.linux.dev>; Fri, 1 Aug 2025 15:36:23 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 484nfe631m-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 01 Aug 2025 15:36:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FiYTBrR4xKYKNSuUnn0N8BUNrCUpjwefcd7NMopM4cAuhU3BAjZJBG8YHHw15iQKmzRJKmV7urHa//ysirOddwqY0r0pFYtbOwzZp0VNkEruje3bbQ7LywntBxTFkeckbrxoCa+ZN75+z1SP2CqK+n16/w498w0hdcL3rlqz2b1/Nw5OeYsWDVOEn1N4gf5EyLqdIABYP4LOavE4yvw9sZQnbiAjavAOTOP/uFZ4lUoeP41f4a3uSppGOij7pSbcFptAkFVKpoABxCD1QVuc6ePR86roMM6cj66qn86Pimg3dBzbZL2rZeREv83eKszOb4pnWhhlSq47dzLY1Q0waA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6SPgw1Z4L3Yh9mOvnfpwjIx4OWNFpwM4R5E84SAjRG0=;
 b=wNSej6sajj7XDp7sqg2175MFPC2XUNlivVlPiuBrSCYNkLePr7baHA/BZLiY3Kh7s1jVGDZDkKKomA2eWDAdRQ+1yZ2i+JMmO8/1BVBXwPLbrhKq03RcA5HEpKY1e2Utj2Ij1VYQTxOQfOadvV9f27p9H1Q1I5lz3RYexqMyM6B8rDv94Iysori4TCagdcWY1IP6LO1TS1jJtG7XWgXPil1UiOaiqkK+lbi+N8tZ5BHHCtZV9d3H49ImeL/fezDzir/qJ026biurQWq33dggnZD+FN6him8ztB1VJITOMN0p5mKcsEScgiI85sEtlo6/rOCI0pvA1HM06CQy9xx7wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6SPgw1Z4L3Yh9mOvnfpwjIx4OWNFpwM4R5E84SAjRG0=;
 b=msWLJUCGwI11Rz3lPCtUch/QQglPj/JPEtHwaIgFpKA7tBirhYIXqgv5EBX9NqH8xTgJTcIB/Wv9l4RqT1wjc990wW8k1MoHdn+pKo2M+pOOdO6myiE8Cl4+AQFttnIVCcknfiyQgIUkD3ZBfttTKl9GeC4Hnizv7rTDlP/5zcA=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DM4PR10MB6744.namprd10.prod.outlook.com (2603:10b6:8:10c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Fri, 1 Aug
 2025 15:36:19 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8989.013; Fri, 1 Aug 2025
 15:36:19 +0000
Date: Fri, 1 Aug 2025 11:36:17 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Need -w for destructive actions, even if clause is not
 used
Message-ID: <aIze8ZQ2iBFSf0J5@oracle.com>
References: <20250711044024.1587-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711044024.1587-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:208:36e::28) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DM4PR10MB6744:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aecb24e-57d5-435f-0013-08ddd111296d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?580H3a+bFI2eOY4aOWTJu/f8KzZyL/JZW4iN0RvVjtGAKmwkMFFi2LYJt5WQ?=
 =?us-ascii?Q?ZGI5/paJ+BzMSIIYPpsDLOAvosd1Unt/frnUQGmUakEHm8ijdBk9hwM+qwCS?=
 =?us-ascii?Q?HuNCPLMrH2GmFribSjHMCZlimQZFTYC6pX9pw2fNezPmN4IQiZ5nDUN1n3Bw?=
 =?us-ascii?Q?UEfmOdJX33vyzZ47/53pfOmsbsNMoUbQvhZW2r9KxfSjrwux8SGGpplHh2Bx?=
 =?us-ascii?Q?mU1a5+9XaoD19JvVy6PbXwQMBIsFnj6n16LZn9uvao2e1l2uqzdTrOlJre6R?=
 =?us-ascii?Q?yb07OT9e6oI8CtNU2OLJrIdRkMd9YFNI2GBzVOtxAuuf9vT7hG9UJbNj2n7x?=
 =?us-ascii?Q?oOKzzAxsXjFNWpR2EIbW+k0FLF9K5eruOIPWI1gwnYwvEDCtYrMlGtfMlZCq?=
 =?us-ascii?Q?DLQb5KvwHzwbmlCJeFmt6zgt30liPW1AArK9pXmZYVyo6nkWUpz5zm2dE/7Z?=
 =?us-ascii?Q?DCCU8DDmmpb6bj7q/lNiZhEiCkzXMRJzKC5G7fwnMZaWENdeo389zogZFJTm?=
 =?us-ascii?Q?WqPLdWjtIFeqZmgXBW241dKTLw39fayc14Ru1ELXwwXYETub9x7bKYmVVLOx?=
 =?us-ascii?Q?qCnMP2XHN4TjWxibhXZjpfpJ6+Maoh4kJ3XO3qo4IeOHs9Nj0kWLmPuKXgVE?=
 =?us-ascii?Q?yh33sSqM48nmIGsjcrq+OoYQaF0YomvM0uIi9ifrFUpW/6hlgxPCGOkKM5d0?=
 =?us-ascii?Q?jNI3dxOfQhhhphqVnXM3jF4xApDkq5n4UzJErdB8eYkYGIVagPe+1xQTHwm4?=
 =?us-ascii?Q?XlKObu18ucEd1q7SGl3o/m5JfE0bPURAvrUli/pDA5A0KV06Vyr61fYVPEdF?=
 =?us-ascii?Q?rtMhU8z91XF57aY/gRPTQ8EZrwklOUs538uSzJWWVGj5CPsyPCFizcpxEfLR?=
 =?us-ascii?Q?/rrapr4nY9Em6VkPZrANK7Wkb8+SBnOecnyALL3n1BeMBWrbVMceSuR6BGLA?=
 =?us-ascii?Q?ITG9tkJVkVQuHz7TzkrRoUAcqTJWKK6ZUtDS+fvLuJeL2fr8s9KYeaY9r7PS?=
 =?us-ascii?Q?Ih1O6LJtct9jxbhzDCR7Q1WKjxGCA0KD8FdQYOcpYyMXL0ErL9Q5en4jHzb7?=
 =?us-ascii?Q?BOYEJqMyR86oTSEkG4+/d3jNJGHbkv+w7N6HpcQ/psVIv6j3rYPWDwyhPGKf?=
 =?us-ascii?Q?fbq8pG16frqLNMkPU4heNwTUFO8/k4optvCd26H7h0jPvOV4qZMi2adB5e9J?=
 =?us-ascii?Q?+I9dD+3YBFJGvGKhAwGBZwW/LRIdrMWo2WXbThAGh8rLcZoqzEtkQz7h3s4O?=
 =?us-ascii?Q?zf55pO2JXDqSZaERzSqom8FuzjCtWqfRtT7rDqDW9L5e+HK7Xlr4ZLHwShzP?=
 =?us-ascii?Q?xSov3kyZ+jVSLW3ZU8ATXJwEXbQFl5Kw4BajAFjnprUgVXVjIUThWYDh28F5?=
 =?us-ascii?Q?18dT2Rl9ZGiQYNy05p/0lQy/VMCiUwOygnsB4yDAsOtPz6EE8JeZw3BSiga6?=
 =?us-ascii?Q?xf8DB6oE5Hc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hoTYBGxHaIJsnNt8GvVPWpZkUFjTAf2gds4miZEjhD/3uIYcW2bIoRQ/b5WW?=
 =?us-ascii?Q?k7pEJGEjTg2dWyfA17dksA/ffOcuEBEzRle+whaSqnfCrFd96c5LGQ5ZlTpB?=
 =?us-ascii?Q?EntLJvK5RrryLOVcAmgR2cVjGQSxDykzA5FFxgREcpRq2w7XvHJMjQtF/sDq?=
 =?us-ascii?Q?zzMe/64zVFf01p+1Ns3GPtANk06eEkZdNKCmj0YAhd4I6kF3VTz7kV9k3CtS?=
 =?us-ascii?Q?TW3kel3NEUlOSSgaa8ASLUrItICYMrygcl6OKDavw2NzcVH/CcO+Sdh6TBvh?=
 =?us-ascii?Q?0/dE8Hb0fTEadWZL1SnoAtbesvBbZYmF51bPt7GqfTrFouNICZsWsc101Ybc?=
 =?us-ascii?Q?xIkIlCKCqQjeCq3+Fw/VVMSpJJPuDMuMU9Kz2Z2BjB5w/ru6BEaPVYbQX3Ui?=
 =?us-ascii?Q?38Snt8Kzw0G0trdCYVfAxY4gf4+bUVUGMmlceim95iBywTAeaafFz5KqAUlF?=
 =?us-ascii?Q?skaWi2KE47goFM7r4s2/p7XzTzkdyZ2HjL47xVHQMoBuZ8Vf5ebrtKodyBcZ?=
 =?us-ascii?Q?/+aGqDkt3pD7C944/zaEAuOHEIxf8HNjeBYylypfUlHLbd8Cwm6bi4rZKWZ9?=
 =?us-ascii?Q?1j1LVnOrG4sK87UEjFeX9imGrmd0O8aKf99YedARKooqux06Rz1aWvLup9GE?=
 =?us-ascii?Q?TVVY+borKBwofcSZCSvRhgErk0SzoLy6XDcA+1HEIw6ZpeaOPQsc0J7TXceB?=
 =?us-ascii?Q?I4vWx5PykKmHeCRieim6IlHf3KdUWuVmNRSX5mpmm5BekuSUe+lTd5fmSLMZ?=
 =?us-ascii?Q?gSHYldckXOcQatU4oDUkY/c3AboFjQtbJI2LvmUfdR5bZhxZhnQoIGr/ZumB?=
 =?us-ascii?Q?N5QPK3yWTkGuLOll9jo36/EkLMDjSzYsMdJ1XEbjBXZi0xwKYOzNEQ/0pfJh?=
 =?us-ascii?Q?yjMppmKdOkkDbJsiDrGCHs0GwDXcU9nQWBXu/Pp8nLUSn6H15mxeqHA6yzGs?=
 =?us-ascii?Q?AYUHaWEnGAuzSkMt4YKe1m/DyCHS7dR7X9AAYKcgPLx5ztpG8BpAy/w2drx7?=
 =?us-ascii?Q?whLflMs9jTtaJxA/qYBnWATTIGF5zDkmWLrMAlVDiXGc4iLGikYixnNl5ir3?=
 =?us-ascii?Q?g/eAQTz/261My1Bj6A69OII9oJa6bcCyJxQCjTl90ra0taKyo0qYNY44Sd6r?=
 =?us-ascii?Q?4cDtQiKXCtgCNT1IfmdhkgY7/agq7XZhcPih4v/UiuGDJKfZi0Rb5hsLQEUO?=
 =?us-ascii?Q?NtKKIHHNkophNbo2fbHkDNyDIYg1JVxRm5VHfT3KRYVVjZlFwanqeW0hyX9I?=
 =?us-ascii?Q?kQ6/S9mi+bN4/qxjRKcvHc5TfPoZxRrMOyoiTOT+ZgyJwa69cdOl13H8jUzT?=
 =?us-ascii?Q?0+nb24mRiDoN5dy0a9/JzN/gEPY0nD39ngyEvlezsACL3iI9dHn75U1rzxQi?=
 =?us-ascii?Q?0KvrkuXxzD1pKDxWfhP5VwHMffuHerZ6kpKpytX/RN6UcjgpxLYcIvzg/kCA?=
 =?us-ascii?Q?RKkoB35/sKXA5U50exqzP7ifI6hDJtPsRp6yCoHxc2BvgZvE2Dp6F0RAuM+b?=
 =?us-ascii?Q?bDdWLzr8c3Jxsy2ylMlXACnwlkUvtlx59Ma6wenDlODITWcjBzoQSz7BfYZi?=
 =?us-ascii?Q?hOeyAEjsOgLgQsps7FIOXM3J40mew9epOiz5FAZNb/GZRtCs/CR3U1ig5U7U?=
 =?us-ascii?Q?Hw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	x2QfRShnEHlQZmGBflRBvvIoeY6npih4oiOXpfx6EYW5sIsibvuz5aw/P0IdIf6A68YnmqGyr7MIa6r38W1louz6+KM9Z+9mTltWZUiWuVLX2lrR0ma8g2hxUekEaR/uB5vuX9I4q/gk27uwAFpoPqga2xg1WGsuUvux/M3rkDTbUbhYiDT+1ChPKw/tR+LPcHXE9yhQdYcYHQofjBdQszvBLp5F8d3EDgvvAFi7f/2lMia5EXDwFqkFnP2A7ae/hAiKz6GFuGOabye0DijapP+e68SF5MndV2Vt0sx0K4YqtcZb+sqWCXnryjmIQ6dxav3LBLbxjaCCmIw3Fj1VP80s0b9d16uAYoUlnVAcS04aogCfrIRhllNfTIeM+5iS7cDsoQ5dVehbCC4DYPvMcOf0FGTbRfpPT7I2M1o+hu1ANMsboC36CG33OW7FIeyWGJfV2pmeCrtMCt87ogDZOuUBtRy5d4cVZ6/NHXIQQxzhctXFste4/0/DUaKFE3GMoOGYJzmWrhJ1+e29RqkyCUj5qFi9o+UpEDUs1Dw00E+cWWNWcvgIcXD9SqPykEca0JjLcALBk2MiydYJzGWwtVFdGik7tlgLAliAWI91c60=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aecb24e-57d5-435f-0013-08ddd111296d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 15:36:19.7679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n+hgQzl+x1VzEgfO6q+vuhlVT/ohSAuCafkNaS/0rRdZKTnEAiB7g5WGXx+wIQb+dFSmPLaKQmVN7EEEYZy4c9gar1vERn3eH51KUizK5Go=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6744
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_05,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 mlxscore=0 phishscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2508010119
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEyMCBTYWx0ZWRfX8qYXwMcgRbIb
 qW0xLxsdjl3aQcvP4jrevnDXz8gM27TGdVjZq067qEa7YlBv6Kyx079ybL4dpwIIEzVhRyCEMq6
 5IsZcqcL7lOLEmBnUNoHG1b6eRppjSS7eez0Ur1cCIyD9MOtCBdOOPklGIApbImfwanYkFFXdYr
 SG2qXY7kFoJONFkt4QZbIhLCijhDE2zUDdxyRPUKPpEEVzdUgTkSP6eT4C8ZsGGYyOwz3rKkmCK
 SAukHriwH+HGVsAqiboF8PcVnBF0k4cPKjK5MLSAqyA2svDpNewlFyS8XJNmL6r8mg1/z83iW9W
 kYMVD1rqdAdSq3AI/RpGZHW5pgXip78AzepBkirLP5KIir60ia+t+cmxan6dVGEEkl7dAPrRgrr
 Tan0tpaWhmXM9KiD284ARMVW7b8KHuYJfc81F+4rqZXVWT/4H+YZEqlsIh6rJArihS7pANJX
X-Authority-Analysis: v=2.4 cv=ZO3XmW7b c=1 sm=1 tr=0 ts=688cdef8 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=lb8mcbRyFir6xY-D:21 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8
 a=dbn_jGX8zj8tvzDMjGEA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: QAOeKjDU3KW1zWgVyUAsvu_luhBb9_9F
X-Proofpoint-ORIG-GUID: QAOeKjDU3KW1zWgVyUAsvu_luhBb9_9F

In addition to Nick's comments...

On Fri, Jul 11, 2025 at 12:40:24AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> If a clause includes a destructive action but -w is not used, dtrace
> should not start up, even if the clause is ignored (due to -Z).
> Solaris treated this as a runtime error.  We should do the same.
> 
> The test err.Z_no-w.sh was misguided and is replaced by a more
> direct test.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_bpf.c                            | 14 ++++
>  libdtrace/dt_cg.c                             |  4 +-
>  libdtrace/dt_impl.h                           |  1 +
>  .../options/err.no-w-or-destructive2.d        | 25 ++++++
>  .../options/err.no-w-or-destructive2.r        |  3 +
>  test/unittest/usdt/err.Z_no-w.r               |  4 -
>  test/unittest/usdt/err.Z_no-w.sh              | 76 -------------------
>  7 files changed, 46 insertions(+), 81 deletions(-)
>  create mode 100644 test/unittest/options/err.no-w-or-destructive2.d
>  create mode 100644 test/unittest/options/err.no-w-or-destructive2.r
>  delete mode 100644 test/unittest/usdt/err.Z_no-w.r
>  delete mode 100755 test/unittest/usdt/err.Z_no-w.sh
> 
> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> index 4e7618e05..e2c3bfebc 100644
> --- a/libdtrace/dt_bpf.c
> +++ b/libdtrace/dt_bpf.c
> @@ -1286,6 +1286,15 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
>  	 */
>  	dtrace_getopt(dtp, "destructive", &dest_ok);
>  
> +	/*
> +	 * If we have any destructive actions at all and -w is not set,
> +	 * error out.  Solaris would reject this as a runtime error.  So,
> +	 * although we could have detected this problem at compilation,
> +	 * we mimic Solaris and wait until now to report.
> +	 */
> +	if (dtp->dt_havedest && dest_ok == DTRACEOPT_UNSET)
> +		return dt_set_errno(dtp, EDT_DESTRUCTIVE);

How about using dt_destructive as name?

> +
>  	for (prp = dt_list_next(&dtp->dt_enablings); prp != NULL;
>  	     prp = dt_list_next(prp)) {
>  		int		fd;
> @@ -1304,6 +1313,11 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
>  
>  		DT_DISASM_PROG_LINKED(dtp, cflags, dp, stderr, NULL, prp->desc);
>  
> +		/*
> +		 * This check should never fail since, if any action is
> +		 * destructive and -w is not set, we should already have
> +		 * failed.
> +		 */
>  		if (dp->dtdo_flags & DIFOFLG_DESTRUCTIVE &&
>  		    dest_ok == DTRACEOPT_UNSET)
>  			return dt_set_errno(dtp, EDT_DESTRUCTIVE);

If this check should never fail, then it should be removed -or- turned into
an assert as a safeguard.  But rmoving it ought to be OK.

> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index e1bb59289..0e0648969 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -1833,8 +1833,10 @@ dt_cg_clsflags(dt_pcb_t *pcb, dtrace_actkind_t kind, const dt_node_t *dnp)
>  {
>  	int		*cfp = &pcb->pcb_stmt->dtsd_clauseflags;
>  
> -	if (DTRACEACT_ISDESTRUCTIVE(kind))
> +	if (DTRACEACT_ISDESTRUCTIVE(kind)) {
>  		*cfp |= DT_CLSFLAG_DESTRUCT;
> +		pcb->pcb_hdl->dt_havedest |= 1;

dt_destructive

> +	}
>  
>  	if (kind == DTRACEACT_COMMIT) {
>  		if (*cfp & (DT_CLSFLAG_DATAREC | DT_CLSFLAG_AGGREGATION))
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 1e105b6e9..cdb222b3f 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -431,6 +431,7 @@ struct dtrace_hdl {
>  	dt_list_t dt_lib_dep_sorted;	/* dependency sorted library list */
>  	dt_global_pcap_t dt_pcap; /* global tshark/pcap state */
>  	char *dt_freopen_filename; /* filename for freopen() action */
> +	int dt_havedest;	/* have any destructive actions */

dt_destructive, and add it after dt_droptags to keep the booleans together.
In a later patch, we should combine those uint_t booleans into a single
uint_t dt_flags member.

>  };
>  
>  /*
> diff --git a/test/unittest/options/err.no-w-or-destructive2.d b/test/unittest/options/err.no-w-or-destructive2.d
> new file mode 100644
> index 000000000..eb9365fea
> --- /dev/null
> +++ b/test/unittest/options/err.no-w-or-destructive2.d
> @@ -0,0 +1,25 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Without -w or -xdestructive, destructive operations are not ok,
> + *            even if a clause will be ignored since it does not exist and
> + *            -Z was specified.

This could do with some rewriting.  The issue is that DTrace used to always
load all tracing programs, and the kernel would activate them as needed.  We
now only load programs for enabled probes (and with -Z active, we may load
some programs later).

What we need to be testing here is that if any clauses of a tracing script
contain destructive actions, and we are using the script for probing, then
an error should be reported unless we are allowing destructive actions (-w
or -xdestructive).

> + *
> + * SECTION: Options and Tunables/Consumer Options
> + */
> +/* @@runtest-opts: -Z */
> +
> +BEGIN
> +{
> +	exit(0);
> +}
> +
> +bogus:bogus:bogus:bogus
> +{
> +	system("echo ok");
> +}
> diff --git a/test/unittest/options/err.no-w-or-destructive2.r b/test/unittest/options/err.no-w-or-destructive2.r
> new file mode 100644
> index 000000000..1a6959475
> --- /dev/null
> +++ b/test/unittest/options/err.no-w-or-destructive2.r
> @@ -0,0 +1,3 @@
> +-- @@stderr --
> +dtrace: script 'test/unittest/options/err.no-w-or-destructive2.d' matched 1 probe
> +dtrace: could not enable tracing: Destructive actions not allowed
> diff --git a/test/unittest/usdt/err.Z_no-w.r b/test/unittest/usdt/err.Z_no-w.r
> deleted file mode 100644
> index b81622481..000000000
> --- a/test/unittest/usdt/err.Z_no-w.r
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -dtrace is running so start the trigger
> -dtrace died as expected after trigger started
> --- @@stderr --
> -dtrace: processing aborted: Destructive actions not allowed
> diff --git a/test/unittest/usdt/err.Z_no-w.sh b/test/unittest/usdt/err.Z_no-w.sh
> deleted file mode 100755
> index 4f129341d..000000000
> --- a/test/unittest/usdt/err.Z_no-w.sh
> +++ /dev/null
> @@ -1,76 +0,0 @@
> -#!/bin/bash
> -#
> -# Oracle Linux DTrace.
> -# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> -# Licensed under the Universal Permissive License v 1.0 as shown at
> -# http://oss.oracle.com/licenses/upl.
> -#
> -# This test verifies that dtrace will not run a destructive script
> -# for USDT probes if -w is not specified.
> -#
> -# Specifically, the script is launched with -Z and no USDT processes are
> -# initially present.  Only once a USDT process is detected does dtrace
> -# fail due to the destructive action.
> -
> -dtrace=$1
> -trigger=`pwd`/test/triggers/usdt-tst-defer
> -
> -# Set up test directory.
> -
> -DIRNAME=$tmpdir/Z_no-w.$$.$RANDOM
> -mkdir -p $DIRNAME
> -cd $DIRNAME
> -
> -# Make a private copy of the trigger executable so that we get our
> -# own DOF stash.
> -
> -cp $trigger main
> -
> -# Run dtrace.
> -
> -$dtrace $dt_flags -Zq -o dtrace.out -n '
> -testprov*:::foo
> -{
> -	raise(SIGUSR1);
> -}' &
> -dtpid=$!
> -
> -# Wait up to half of the timeout period for dtrace to start up.
> -
> -iter=$((timeout / 2))
> -while [ $iter -gt 0 ]; do
> -	sleep 1
> -	if [ -e dtrace.out ]; then
> -		break
> -	fi
> -	iter=$((iter - 1))
> -done
> -if [[ $iter -eq 0 ]]; then
> -	echo ERROR starting DTrace job
> -	cat dtrace.out
> -	exit 1
> -fi
> -
> -# Start a trigger process.
> -
> -echo dtrace is running so start the trigger
> -./main > main.out &
> -pid=$!
> -
> -# Check again if dtrace is still running.
> -
> -sleep 2
> -if [[ ! -d /proc/$dtpid ]]; then
> -	echo dtrace died as expected after trigger started
> -else
> -	echo dtrace is unexpectedly still running
> -	kill -9 $dtpid
> -	wait    $dtpid
> -fi
> -
> -# Tell the trigger to proceed to completion.
> -
> -kill -USR1 $pid
> -wait       $pid
> -
> -exit 1
> -- 
> 2.43.5
> 
