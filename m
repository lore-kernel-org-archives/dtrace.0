Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AA6340A46
	for <dtrace@lists.linux.dev>; Wed,  7 Jan 2026 14:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767796260; cv=fail; b=HTNBg+nnil9i+MVln3sB9Zcs+FoD98mwW1e2kyPo4/tgjUZEmf7FYUzjKZEtJ9lIlfyOjIqEfqD3wWhWrlQr4PNCnuMZSnOa+dUn7OPcFUCn4qFQzVEe6ZGQp7V6TijjBuIv+fnuvpxb7estlWq6F4ik3Vick//ZX+6D+OFEVio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767796260; c=relaxed/simple;
	bh=NnvV6C3P3WTAJ4JdIy1Mpj61vBwhpG/zU5cGneNK6zY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YYqEz2Ta8+B3M0fGq3RcdcFDCldSwEPx65L93ifB57Se3uVi/xNYDSemmBNNf3YgtKDA3uul7O5zg06dilKOwmTGwv75c6nHzycnDaFHoVVTizKD2lg22VMzhY5vSZO66ir57qNaDWlYCUkRUk4kxJLvC4TRkax1Ks4hBxa6C6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rO5Xdwhe; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=j/0h0nUu reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rO5Xdwhe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="j/0h0nUu"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607EKLb31873681
	for <dtrace@lists.linux.dev>; Wed, 7 Jan 2026 14:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=YLeVeaHjqpJmT3heZIxvPC1sBfueahz3B3F24z8KoiY=; b=
	rO5XdwheEFVu/vKUPEA+ZbrQQrlmTqQhOZsTc2byMq1XG/hq6rKN+d/DouSrZYYc
	oiOkrIaEm6MDVsZto1thiTFLAZp4vnKihJ84cZ6DEHfjktPSngEVaMljY8I2ndlm
	/FZRjZRbDJbSAhmPwTBY9RKq42Y04r5IMZ3hKUHkF0FsW5SVWnfA7Nxv1Lwv1DPI
	rBx1siNHBSjbV3w9kOvSPpEkpeSkoCIDnMOGxwWdUCFCcHCxKmXZKE8CYdriCzlh
	GIHb2xSotEQccDrSj75LnnV56vojxexifD5P/8C/a7QpQ9IJ8Ut7OfD3ZsFGik84
	2bt35Atc3Jgcdv2/+fovrg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bhs5qg0gn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 07 Jan 2026 14:30:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 607E4b60030826
	for <dtrace@lists.linux.dev>; Wed, 7 Jan 2026 14:19:37 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010038.outbound.protection.outlook.com [52.101.61.38])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4besjdx75t-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 07 Jan 2026 14:19:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OqOzdhf7TpZ90kU7KCVJTdRIQqcRKFh5t7G5wTjXYv6kndMAXONGb3XIyFq6RzHm2NYnD8yUllYDU3/dGtVmd47+obN8HIQY0NioWtto+p+YB1aQHRpDM+/TCm/K9AtlhLhGlQXHPNX/zu0EPD6LzxGRjokWQDko9iI09N/hhFweMSXeYzyvh6L7OtahybreeoDv+OYIT4tQKR60evVoqOIDuvRtYnphDhnlAQOhD67dFUfhbL55tNPgrStj79jj5Ho9w4N02opAHD/d9Tdvlvz2hGYO6/CGRBn5l5RLlm4BJOmstfvMmu228//qLE5SFw8UuKmqQj+afKRQl5TuuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Z0aDopfuLn5sW4+FyowwR3zXZbrg9S906SJ6OHVAmA=;
 b=II1ey3kDBGm6kuO+E9qk+QlGuK1GUGmMwaAPayMWyrD3w4o98eq1nxhO2u7FJDfXEme4NL311I8y1dR2R7eEvaor3xC9lBaIIJk/Xp7Y94ktMyQxCPK7JriiNf0tOAbcShCGR6q2BRTMVITsKo3w8CyWvdMKRoG5t8N4JJ/ehmfX/eKsL/3+0M4Lrhsn2Lv5f7r3bNChCMFPAPfIkHCOmd+iaPRwGLKdxoV6ToZSD0zkzV6NtqqBcOoiilgGU3phaa+VWTIdgTtFy1DTEQDiMkpUvyovKMyIdUBNF5IRQz1tI7tH/ON8b2kMxHbH8Y/107Pgn32rdUssUp1RV3NAKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Z0aDopfuLn5sW4+FyowwR3zXZbrg9S906SJ6OHVAmA=;
 b=j/0h0nUuJTt3vmFKM9XYfLiuaCVYOuYp1/rkYniR54e0VXXwXZFEbHgPiksgKq6viGyVeslayBYyMYs+c+8rLerGmBdRtkh1qxsuKRbhhqYzFL6qBgQg2KxxwGeH7l/rHtGRLswXgGR5dD+wHt4qPU3Y7hPAn1ziEDabfXW69LY=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by BN0PR10MB5160.namprd10.prod.outlook.com (2603:10b6:408:115::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.1; Wed, 7 Jan
 2026 14:19:33 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 14:19:33 +0000
Date: Wed, 7 Jan 2026 09:19:30 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 3/4] bpf: allocate the buffers BPF map to fit highest
 CPU id
Message-ID: <aV5rcv/s8A2eLJXi@oracle.com>
References: <DS0PR10MB7522FFA1904E3A7555E4BE15C2ABA@DS0PR10MB7522.namprd10.prod.outlook.com>
 <db11ae09-92a4-26cb-d8ec-aaef1b5574cc@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <db11ae09-92a4-26cb-d8ec-aaef1b5574cc@oracle.com>
X-ClientProxiedBy: BLAPR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:208:36e::16) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|BN0PR10MB5160:EE_
X-MS-Office365-Filtering-Correlation-Id: cbf4a28a-c666-45ed-3d09-08de4df7c73d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?t1EFEVv+/2dIpbk/lfwqkimV9Odc3OLOF7xXGeK4JD/DAXWHUbE+l3c5L/?=
 =?iso-8859-1?Q?yYBYpSrVktgCXO5BI3wl+szcdF48PFhRSAD8cvyE8KUi6qArfyqbTtZHH9?=
 =?iso-8859-1?Q?XA8ZnUFGmXmZk8puuhyQZQS4UFEwEnwb1feQK6jnJ4BStI8M7rFW2Kxu8O?=
 =?iso-8859-1?Q?Y7R5bfS9xojf4i+/5yAKG+IMtTrmNLPRi0gGWYypXjgoqvkCvuAeRYb4AT?=
 =?iso-8859-1?Q?xPJILUyoULvkx1chUPalxYpwP/WJMFPVJjtAQozzPZT3/Lji8biPJCZ9dv?=
 =?iso-8859-1?Q?cNQSq3UgeWP5dRD6d59E17dBJ8+zJKl2yijNPzffXgdbr1q79/7mU/f1Ez?=
 =?iso-8859-1?Q?9Fb2qsqbwuIvC5Yzro2KQKjB+zr/mLsZqWMXpfK//Uv1nyuMDj9vnIu4nW?=
 =?iso-8859-1?Q?j9f+f9eGZUM2CCmQZpC4+EhVeXBojo5RuN1DICr9nILkrc0phaCKJ+d3VS?=
 =?iso-8859-1?Q?K92rb6P8YUB9eVRnMTSMwM+U4tn1gBThlLIdJrcy8o3jocniD0ixDs30P9?=
 =?iso-8859-1?Q?k1BNiP87icAoqJ5KekuwqHLvjvKN7ErZVm7L5uofwMal2eMiZxwe0RiWjq?=
 =?iso-8859-1?Q?HLW4Eg2uCP3Pz2GsFmOmFeoi9qR2h0dXFyTioEsQn0cA4FYKSOPQGA4FOw?=
 =?iso-8859-1?Q?Pg0fyo3M6/cNNFSNVt7dS9mv5081DwfMiGPw3crXC8pIh3L+3tmD1dQFh/?=
 =?iso-8859-1?Q?uZ3m4FaYMKSB3dvnoPh0OEonqEsM9WAkipIdhuSQSC4fGFm5Zy8+9dYMVA?=
 =?iso-8859-1?Q?hvrgofz8IxPPw3TIPus2BpainuCAzVsRjnuOyymKoaW7sCj4BMZxI2x5+U?=
 =?iso-8859-1?Q?AZ0Z7RtTyLCW3ku/y7j9LVcm+P23YZYrGrHFeF1c1GgSAg8lGgzCEMf0Xj?=
 =?iso-8859-1?Q?zl6ILYDnV/800b4/0aFrduHeDlvvlvPzj9NRlTMDtzqUQ6J/aZxCl8bq/f?=
 =?iso-8859-1?Q?PlI2XsI53yWaqpXByqhS+AcS2g/f/LT2ZIkrigvVqanqbSw85QA3/N3UaX?=
 =?iso-8859-1?Q?QZ/PsehHmGJ0Qn9IaV6db97lePy1omFBAcsflvNowxyFcNsmArkEs/4YKz?=
 =?iso-8859-1?Q?euwf188Xg+0hqL29pG6J/jy3rDXNERmN7xV7cfNJw0ratiKVRyp3oWBaDT?=
 =?iso-8859-1?Q?XIQ6p5XSlrC7MSq15Zfl82dvplXVJa8KCORBbs96XJWFutxRJM4Ro00LPM?=
 =?iso-8859-1?Q?xLbf4cZr4OW/KPj5QWWwzoFzNwcP187QVMoeqJmHEIwYLajwGAQkCgo2vw?=
 =?iso-8859-1?Q?uHEMBML1aAATLb/CgCtzNEkTJxWjLfp85Clr8BsKVMmjIvIcDj7SWqcMgd?=
 =?iso-8859-1?Q?iYWJEycE8+mr7TnOI+H4LzTrMqqrf5q5I47WjhqdpqzNRmqAaGFkPZlkaK?=
 =?iso-8859-1?Q?Pcz7gsPYtn37gQNEN2C5ewBVxsbC+mmlk2Z28zR+ZRGLrdyLXSBaMJ21Wq?=
 =?iso-8859-1?Q?yJpKxw5OrAWQmHnB+mzHldlPXvjg2joCzKLpv95grQ2YjBxNpOXcQ8/yrD?=
 =?iso-8859-1?Q?ocQ9FVP0OiR4nmYQD/BeUL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?o6fV10E5R9KYwPnItHo8a+0XNWM4WDtVZ28EsU/azJwKYz9rU5OP0AsEIn?=
 =?iso-8859-1?Q?MqNfsd+l9u/YKLCxyjuKbUgaTGnBOULwLn1hg819VBJ+FdH3H3norMwws9?=
 =?iso-8859-1?Q?ZA0LyGKfBlreDyCDEYVKyGAP6LfivhGx4wRLJWikSv7y6OkkdzbajkJFm9?=
 =?iso-8859-1?Q?OxOzSrI0CrNtAUX4uWjLsbc6yYVEWU0v9QZKMOHr4f21qdLIYgAn6SLlHp?=
 =?iso-8859-1?Q?IImcJ/ALXtHrQx/zLWKDX6Re0zQBJ43ND9ZyegCOJBEdwyR0evjiNihW5y?=
 =?iso-8859-1?Q?fw6OnIg1GjlOOxdmUCUFpKPe4Xv5NrEX4zwEjYEeV5jG9aYacqHfIxBCKb?=
 =?iso-8859-1?Q?e9soTgHN2HCeLf2/I4Wsvv3HWr8OnSVC9Vva0cb2LbXOayNY11SwGj32ap?=
 =?iso-8859-1?Q?C0Yg/TQgest11kWfIyyRS7ANiJKzxaoS+7oWf+vzVsHCQK4Uit1GHZYRgN?=
 =?iso-8859-1?Q?niVsw2/L2HSQ6AiJQFBGEnmwFN3zIeHdIrA4cPvIbI1wk1EdJkrz3iA1Qf?=
 =?iso-8859-1?Q?8NDoIVAsyUAJ9F0impFmziTTGoJ4Jmpoh8PiFXk1WcmgmNdL6zEp3UAG2l?=
 =?iso-8859-1?Q?CwgUU9SBtjEzquJzk94GgV3fVXa+o/DN6bZhX3xzP8dtPhZGtbFBvEHsNo?=
 =?iso-8859-1?Q?Ok7GAe7EJTYWNN5h3Q+jeAeTRKOxNz8JvrmPhhlqI8TkjW1O4QxOa9sjv8?=
 =?iso-8859-1?Q?sfLgixG/TvDWkvrHqiUrg6ohjsvffGasE40GKMSCrbwvx6TLah1gESCMKa?=
 =?iso-8859-1?Q?49ZDrVVbb2D37A2+0bo5unGMPeW3Ucu0E/iIDKRc15qwnuL4ve9qQynsYa?=
 =?iso-8859-1?Q?ww4Byhf7EAdM4dSIXQVwSIp16YXdAJIOXydsPRX0jObUknbG+MswNtjUh2?=
 =?iso-8859-1?Q?G/AL+Du8wL1U8MYqJccenTj1jq2zMwYLZ93gHPDPt32sKgeJowMdUNfFgx?=
 =?iso-8859-1?Q?7QXE958bAwkgsEoWVxAoARUGweLVCq0xD5ixNQZ+4uCQYRHgDWRVgJk1Xe?=
 =?iso-8859-1?Q?d12V7xX7iUZGGJ+zWQWdInBHNn//EVEKxUsE0yyCtsJ74e2rhBl6QxqnsI?=
 =?iso-8859-1?Q?gI7KRkjQoFOSU3tGWjCKcqx4Jiy+OS6plO0ra3mitiRqh+RWCtW5t8ltdQ?=
 =?iso-8859-1?Q?mlkS7R+v22lHoXA/PiK4/QjjWzjUugacbx6e8Oj7K/yXwaiN8fiN7meSoq?=
 =?iso-8859-1?Q?N2KVnpUHheDT3ZUmO9dIbaUVws4kOuJCAqXrXyVqgBTEKh/ml/nTDXw1b4?=
 =?iso-8859-1?Q?IayEt2IXfPC7f+onaqUbgfrrsBKpG7n7qAJHE917AfQijbkX9dlw+v58Z7?=
 =?iso-8859-1?Q?82oU7J5qwoTZ83BjWYVphNkgSAuRmJ7mftbHObzK4r2rkmPV4G06yEjGP+?=
 =?iso-8859-1?Q?XStys+xEbPlOLG+ZJkFJJ15jZqixUodVt7nIMXIXKxce2oNV/GsFDYfx0F?=
 =?iso-8859-1?Q?9J1FvhC8Rsm/YFdI/6I4TebsKhSahBF5wD9m/bvUmoYvgGlcpDzlybvY1l?=
 =?iso-8859-1?Q?O21iWt+Gqwd37W/ET5vi0/qAZ/9Sp4bB4rNQorIHhFnWMAWyRlx8RrEZCT?=
 =?iso-8859-1?Q?begT3QFieBI29bA7tFLm3A63cLXCwTZOfXKK/SIBevhdXYYhhLT7T7XmiF?=
 =?iso-8859-1?Q?odiEDOCGVALZnUog+BhxahhewCO5a4gAWOSLCKOssK7kRrV7ybhoBmyDfz?=
 =?iso-8859-1?Q?fmkv1/nIZ9aqQMZ3+CCO/WIesYfIavJ3LGMxtAKC+5Q/oCMcAQbGDQajT5?=
 =?iso-8859-1?Q?QHP5mmWq8zMVEq1GrFiQL2T7U3JUD//16ZUSUnMYk3k2XzCOyUtJuI6C40?=
 =?iso-8859-1?Q?gmQs+P8ALA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8XfAhHU6jCWdk8gW7+X8R8UXbtvCh2IYOJTccUlP+OtuAnXGiypeokANOZ8VIIIx/6o1buBbzzH7Cz3DuVci9yISFZHRPvzz50MxLPREmRntW/j59fhevXv6kj/LErwBDUBnQHRCpjUBcwPzKwwF42VK6J90v8wssq9+9jyu7l6mHhS5F+CuBWRbhXaHPmHVt627pYccXnqlaUcaduuic3DsIUvmLfH5tiWQaczAc3or5Xe91avkp8aPC2po1ik5+xfk7clnav5qyzMHgF6ahAacLbTA+iK7+lBLoJi3ye9z3V3aBFoe/8p4rqYhM++jjJBky4Me3lA2ZMstC+xLaB0CmhyvPVKBlQ68FGS5ghYzgwtMCjxinu36F4sUqyWc7hlP4wA2wXfiWgBPt881Fm/Yxm6rl1mzeEspAA4BdK+//9r0N9JXxMCc74DrnP8352ajt8CZB0p3lVSg92lqYQB0yhy1VEIvQ34t/pb0NLsXQMz1+yi0KYOmqKBasKMEyUWgXevUPyFh9w9GL0cp+hPIDI9TIH7qSxQdNl55jCbu59g5X+XycGV+OGzDGS1QtHCWls+AP+J2aNkSPkQSh2b/HQvO342zZRCYthS4g/U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf4a28a-c666-45ed-3d09-08de4df7c73d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 14:19:33.0313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XwDavj1vurfwDGlYCaRM8JGhmgqH6UvF7kQmNeZEZ6EZ0l/CK0BcvXbaKTzeR5WpAeLT8BaiAnX1SHaTBXCFu5rYII7TaPAPtTJxd60b79Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5160
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601070110
X-Authority-Analysis: v=2.4 cv=LumfC3dc c=1 sm=1 tr=0 ts=695e6e22 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=56WShKmW_BRAnPqRoNoA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 cc=ntf awl=host:13654
X-Proofpoint-GUID: NYJ4_OiQJN4w1BBNh0hy0KCyvfPL3c0h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDExMiBTYWx0ZWRfX6FWnmBXIZdRx
 Ksy2zxkRIQFtDSpHiNWPr3q+4XH90f+usb5Jy1SyfjLYA1F8Tp1M+KBJJ7mp4fQMGaVCpyr/RPI
 wvDDE6R0NLVbJnQRWjD7aK3183xJoZDp7nzwVsqzAOJkwNkn6PyphqhOgeMe3AUSKEffIpC+bQp
 bGwLy6OXgkp7XvxIIzMYQrncf2vHSEgZFgRjwCyxLwTZAM1N7pE/Tdh/TX1ltDG4V7jEQRpnoE5
 A1rTfdh7cID212JjX0T77r5XlWLDVYG5Zy9f+3cea+5ZWpoWEscbgIOVY7WI648tajJab2e2+Oj
 rfdHCYA8OEYdebT2JV6rXI/PgJZiMt4e9Zg0DZKhuU6fXAuXz/8ZAtVL018sZT1C+o0+Ev4rUtg
 ddt94klH4NMIi27fuplwA3ChbDzM/6a8iED6NNTzrRRAVLF63bxpYfM7JVEx8Ft4vQtlEtgPabY
 gybTn8lJ+nlRQZLQdZDIhSKuUo3tzlfxE6wjf6tI=
X-Proofpoint-ORIG-GUID: NYJ4_OiQJN4w1BBNh0hy0KCyvfPL3c0h

On Thu, Dec 18, 2025 at 03:10:32PM -0500, Eugene Loh wrote:
>  Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

Per your reporting on the 2/4 patch, and further testing, the array map needs
to be created with size max_cpuid + 1 to accomodate the CPU with the highest
id (max_cpuid).  I made that change in the patch and it resolves the issues
with tests.

If you agree, I can just make that change in the patch, retain your R-b, and
merge.  Let me know...

> On 12/17/25 00:10, Kris Van Hees wrote:
> > Even when less than the possible number of CPUs are online, the 'buffers'
> > BPF map should be allocated based on the highest possible CPU id because
> > probe data is written to the bufer that corresponds to a given CPU id,
> > which could be part of non-sequential CPU id configurations.
> > 
> > The observed problem was on a system with 128 possible CPUs (0-127), but
> > only CPUs 0-7,100-107 were online.  The 'buffers' BPF map was created with
> > space to hold 16 trace data buffers (one for each online CPU), and since it
> > is an array map, this caused the trace buffers for CPUs 100-107 to fail to
> > allocate buffers, which in turn caused any trace data generated for those
> > CPUs never to get reported.  Since 'buffers' is an array map accessed by
> > CPU id, enough space must be allocated to accomodate the highest online
> > CPU id.
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   libdtrace/dt_bpf.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> > index 0a57b7d2..6568a572 100644
> > --- a/libdtrace/dt_bpf.c
> > +++ b/libdtrace/dt_bpf.c
> > @@ -755,7 +755,7 @@ gmap_create_buffers(dtrace_hdl_t *dtp)
> >   {
> >   	return create_gmap(dtp, "buffers", BPF_MAP_TYPE_PERF_EVENT_ARRAY,
> >   			   sizeof(uint32_t), sizeof(uint32_t),
> > -			   dtp->dt_conf.num_online_cpus);
> > +			   dtp->dt_conf.max_cpuid);
> >   }
> >   /*
