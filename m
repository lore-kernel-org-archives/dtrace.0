Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9E82D4B71
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 05:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766123670; cv=fail; b=lsr8XpOo2GDl8Rxbe5vfaaUjr71OOsAaxZwWRftT0rn4QrnDylloxGsF5KRVGV4npMy1Sqd4KyaG57k5s3HoQusni8JLjjR3MMrxKYdBaooI/zT7GFwWQQIwDftLm6zMHnyPLgi3NqmOTkfmxY4PczdNk83UQ4ZnEOaCvsdUSrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766123670; c=relaxed/simple;
	bh=6GAWJfIuHpVM7Fyil1hnzjI3a2DLaimNb5tDxTO21Dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SCJrw2EriP/yZkjx8MIZXOk2lrHjInEbhgpCMRlKRnR/wFFITuBcpKGVZpnI2dKL3Gj1ZGmWeQ6nFmZDbh8J3lgp3AHqxY4qICY4vfXPYUrKKVSxylWaUBrgqg3bs26aI7O3I0aEHZMo9RKClokiwM6aZTU7WepnEEFaTdftuhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=npBmfkYI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Lfa5Z6dI; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="npBmfkYI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Lfa5Z6dI"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ3EYWG2840969
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 05:54:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=VuTBNA5TKnwQG5QK8m
	YnqvJgmGzOfSDoTzA88ib2NYY=; b=npBmfkYIwHQ+8FP2qhSHvwTMNxJz66sfmO
	DkaAjYhaL0OhCbt2qAbgADj48Vgkgjrmm6IUTKUb5BdUCpiplmXvnEKKu47LeIgo
	eXCkeZa26KmlrZx40xlst62WsR4BhG/KcJpN6a/HnHHmmwD25JhxpBDxB0AGxC36
	g66onhLIgkzBPJXBLELX2RoiHQWBTL+IMChR1a41/nRJvmQ/tMQ3N1ONZhn5zLRp
	D72U8vHXXsQpJRhjhXWtRaIrXF9wUtS3qLRukEW7afAPt73Jni854YkQDWMm+FzW
	D8RMQ87PNk07MNtJf+yUmbUsPFJkyBoLnsd6N/KFWFnraLdWmXTg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b4r2cgh89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 05:54:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BJ4REuJ036894
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 05:54:25 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011020.outbound.protection.outlook.com [52.101.52.20])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4b4qtkyp2x-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 05:54:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L/gOQY8cKmufbIFN8dT1Bkc/18GDBD6JZBW2XatpI2itgn9FiVe2PZRbDsD7oCl9JxaYgEQytGwVJzrcdm9gKGYIxnkaQOeI4G8NG7b+F5cFhiGWkIYa0wif12Ehz8dvCWAjU9p+01AnKjBRs4n+UjnK3xy/HCv3JxO7osonzDTIDTyQvaTyO/hWmI7ahRL/EbphPW1o8VYb6sT4mkoFiQoNjFr3EJaIZPyTIRbMJQElEupFM/ITK/pyo/drccq2L4IOsuOBRpOR2+krN/e4TRkqICXYrlnBNV0KPmpzVysXo7gWPiX2AgLCYv7qOt6DMjbD6vnJP69KJYNYdkn2+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VuTBNA5TKnwQG5QK8mYnqvJgmGzOfSDoTzA88ib2NYY=;
 b=xoySzqx7jyWMOcbM6CVFesD+ISez4wjdvo0CK+Rz/tl2Je0PsDN4vbkIDI0RsYTfFYIK0zdcux2Uhm/bdpT9oqicthnw5OO8ExTq/aR0/zsptUgfvnvkNYqk6X2chJobCXiJs8aCPKySAAR13Y68ek+YYhQAnA7jGtkIc0TUdsbQj4ps4wRmBDRA2tgmNkPXZlP1FLo8N5Ws2/EGkd8tefcZstsEWuj8mjYQCGnicUUqLwVlo31ZnEa3FKD+0j0E0/v7nLo9SKLigGJR9DyO8oSRGGcIfd/zm2TJz9gmTwSf+4OVYD9z3nmugLv9n70dn1+Jks/oMiZBpE1NSbnh/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuTBNA5TKnwQG5QK8mYnqvJgmGzOfSDoTzA88ib2NYY=;
 b=Lfa5Z6dIS7UJVH0nYBpKI3mP6yfjRnou7q9mxUJriqcjjGgw/7gTYo3Bp6uNqaH+zP1m/GZ+oF4TB8D6oH40mr1a1mdwhinAxBeZg8JuDtjbJ4ofdT3POmQ9pm84fg6qWdKYtduDjR8g4LkR6BGfkBUQ5bb9lF3rDQyeHhceflA=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by PH7PR10MB6966.namprd10.prod.outlook.com (2603:10b6:510:277::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 05:54:20 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 05:54:20 +0000
Date: Fri, 19 Dec 2025 00:54:17 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 1/3] doc: Move `` inward
Message-ID: <aUToiS1oK/5/KdRu@oracle.com>
References: <20251211190003.10486-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211190003.10486-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:208:36e::15) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|PH7PR10MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: a1067402-68e0-4aca-3fcd-08de3ec30d73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+RCyWiRWdLyBfUCOE45t09zTF2mqnbgsrurf40VoPqgjBepmI/FOjJfPe4qA?=
 =?us-ascii?Q?Q8r96tL/YvKpp0JnZhgWjHGGhwkB3+b5ZvV5j6oTSGw3MgMDZgu5bQJE0NNs?=
 =?us-ascii?Q?Zsw5PE1CkCDy3IzON7TN0zcon7RdcmWVZSX/vD5ZPPjtd3aR8I3iSYdii3Gt?=
 =?us-ascii?Q?CFD+rVQbVNC+vtgafze4pPWn06saMKYBM2asTIcOnu3icv3Hya1Fl511PuJS?=
 =?us-ascii?Q?ATGCBQByz0ttp6fzF+X59SP3IIQ2WZgpAK43AaPlyV4VsPXsRBQ+EC/y2Kmb?=
 =?us-ascii?Q?abAt9EvVmHohibeJtWFglxw2BEx2kD2n5sogcG1h0epcCjU5QXTiSXIFxYv0?=
 =?us-ascii?Q?UAf0hgDr4wBY5BxC68LbmioBziyJyo426OYrt9HdwNhrtJgwImRL/NfSM0EE?=
 =?us-ascii?Q?c3Q7yU//Mxyaac/hVVn0h56i9jfywc8EhDmErIuqqyaNFW91iP1X7bjSlzHf?=
 =?us-ascii?Q?qsFIejvaBgBe6P+dj9pbGaMYgaRy69H8PkP5NWFCtUNq/weFtyvqVWZZUjCw?=
 =?us-ascii?Q?OSLYfpL+P/0nfNJJT7lN+vCiP8UeHxkrrhRsx39RnN0P3QX4twg5hXj6z7Ag?=
 =?us-ascii?Q?xJX2q1VLoKlrVwCbO7CV3ECD5Sg+qX1lcUFl3FS7vNCD8lxdu0r2HEfLvAzS?=
 =?us-ascii?Q?A4CFLtr4/u2mpgrQBOMCB21FNb0bbtqVWm8Fpwb8+3L8ZcA2qambB9Uw62MI?=
 =?us-ascii?Q?5/XNxe89ThyIxIB0gnX5Ln8PA2c5gqxupi1/zZ1nt40Ewu541ROBpE5sVvKJ?=
 =?us-ascii?Q?Wy/f3JGZf0laRe8NU0YQ9GgJbe8qZgeEkvlBiZtwWl66gen6TrlfJnwLN1v4?=
 =?us-ascii?Q?NAwsHl3TDOt1yvH3EmLzAoztxBlJwF2epczepjSmt6HNfJngHrPFY6Ym9ig+?=
 =?us-ascii?Q?0QjuJPom7HTB1xhTD+xe26L5ddDS55oD1o/NufAsAf6QNzsr7f8uzMH6LPT7?=
 =?us-ascii?Q?eojEblzLsQz09HaAXBo5nDupiFX4sm9Y/aGRjoaB0PB2RlY7XM8uvEi6qu0E?=
 =?us-ascii?Q?hcG3hy7H6txQEAAC2MsJrhS1rjt7ZrLCEm+Kv83z512JiZYcGlNN6ZD6YYo3?=
 =?us-ascii?Q?FIktX1FKWtcZxjuoj0zGSSN5hFd/m+UIoNoYd9gt4ijbp/fdVBGlNuzMLcEN?=
 =?us-ascii?Q?ya5360B/GlMtPAOIyu6An0XcBcQE2UcNlSExJdQPDoV0fHMYEgzvPub/M+Jf?=
 =?us-ascii?Q?x+M9Hql7Pj1E28xDYWjcUNAIMUFOuud1xlokm0lhWcfcVGVR+k5rNvDirlmU?=
 =?us-ascii?Q?dRP1w/4AHXBNlan49nbmXEEowjWwMEjpXYKxMNjp7t8v/fEDbCHUtSnlma8J?=
 =?us-ascii?Q?K8BJC3FU1b6UH1R4HCdy5YEPbbV41SkHN8Ekt86RinI55wuwtc71uRr6IjQf?=
 =?us-ascii?Q?YCFsNZnmbtWmr5vTeY45AcgVOKO0NceslvipYY9n/S/+0AaM7hwXl/bNO4ZJ?=
 =?us-ascii?Q?kmOE0BLr3nA3YxDOSJJ1dmZnWtNDx+Th?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OdgHY2g0tCoNjtzfEulzl6gWHfVzVVB4crIayAoAMrl729R2kR9362QjICOQ?=
 =?us-ascii?Q?2JetAzfX8GgARC738q5/LaLP++kU9VRcUkTWwOxvamFAADo8KWTHUSQ2e7GY?=
 =?us-ascii?Q?7NBrMiVHhQ1om6APJZlv1mOcbTKY+QHA/4Xh+swut5kt0bjgzB0JMJF9x0Oe?=
 =?us-ascii?Q?PzJLtwtw8gIqjOywccwOm9ukNYj7neuRuwWcF+gweqaJRtrMIrE2pDIOB/Mw?=
 =?us-ascii?Q?GnF46lsLi92renEZZ4uWbjl2Na2180fLGk2iTvqrjnJSPRqQeT5sH9q/ixks?=
 =?us-ascii?Q?ZtaQiIUXLMN8XKiTdIx16DhWi3e8P9VGX8D7JPsgu1sGSo/KyC1gGxm8eokl?=
 =?us-ascii?Q?6k/t2MzjB5kQSPdEacyBeI9GPEr36CUNoDs1+v9UH4NRh1tZk1PnqwExKn/2?=
 =?us-ascii?Q?wkfi20Xtm8sExafqEoXN/e4ee+/Z1tmkprXAzWv6LIL+xtCoHI2ccUl1mXBF?=
 =?us-ascii?Q?ay0Wjj1c9NZPW+wlBYmwav2AP3t6ctO57rFU7JeerNOWxU7PiSJfMgFU2Vr6?=
 =?us-ascii?Q?1AX93XVEo2wUxQBMajIFu9V4F5sl0ZCqZMYLR7T+01CBWbtu4rqKkmrn8vK/?=
 =?us-ascii?Q?rILkR6DI+tQa3+m9SHOo7d5p8vGVrmViPULrmu+hB4Gr4nq9wpkSy75eEVOa?=
 =?us-ascii?Q?m43oMUZv1lPBaZVbiiEhXhpg/vj7h2Snb+UtPKxfb3aJfOTlwUf3RiBzcM1R?=
 =?us-ascii?Q?VJhK6/WK/vi6HOvFn6t+xkOxFrgMUIpv3yoca51okwS6XW4XEIAoGXflCjiT?=
 =?us-ascii?Q?ciw3mhSLkkXE/FQlyPFQUEeKo/x9HAqO5eaFlGJLMsh/w/Po3+qkURk/p9nz?=
 =?us-ascii?Q?WRG4xM/T1Jo2T7fEubhZQj4a8mGv2L1YOLeT0K+pdlQYI+lscKSy+UT3kmV7?=
 =?us-ascii?Q?bRQHlgixyxJN6MzFZoN0o/baTJ+JZvGuG7DoiJ6PLGkohuagtOWtFFjTJwHz?=
 =?us-ascii?Q?OaT4EhMLPh1OpKXaVigv7Fno3NUbAuujkEvgwW1PQ6/7NsaZQxtlOmksHSTO?=
 =?us-ascii?Q?gLAiXWHvUCzCrblMAwOR9T4g65DJH0gAa1Rh217Vz3OhwTf097BX71HM/JSg?=
 =?us-ascii?Q?cW2ULhOvWW/5ujnIq555948LKJuQvJV8Wn3JMg7CVz7ivp/+5yPETV5uik23?=
 =?us-ascii?Q?/jeC/cJvVAQAr77hnRm3iFKlQyhRd1oMV87wBvP97MLdbgEiIlYtKSLa5Fgq?=
 =?us-ascii?Q?jT2mvpw2F/ds0izak8WKdZ82nwgABrtVoA9vw6esUHe6XeQXhzQL6gExnFJX?=
 =?us-ascii?Q?QThL5ym4fZPxSr7eEDTYOYhd1CjdqeS64+lVlYACvkGVdqye+RaT+0I58KaK?=
 =?us-ascii?Q?RJ54Aq8oEktmeJcMwnMitV1hTSXBRfY+rrsBmiBVW4nhzoy0tPpu8sDgCgRY?=
 =?us-ascii?Q?nD7k3oryfYwKRm072xfdx80F+ZnFy02GbfUW93gWGC2KY0QY7i4BdufPeZHC?=
 =?us-ascii?Q?sBfzCq1BqMLxz/DI6j8eYjpIxzdmY81vIrDG991a6yRotyRnp/g0VbXhlhRL?=
 =?us-ascii?Q?OBJqcgPAhqjY+aJdsywrnaJY/stHPD28iY5tx/Xufy+F11hdk3/gz5WqoyQh?=
 =?us-ascii?Q?rWRM+ltvK0JgIGkL3TMFB7/zSQmFrzNqOtNsJFuL30sXh502gEzvop/mi0rK?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EQbaEn9ns/X7trjjCIAYJCo9C/H3DHc2YIA/BAJCyDoV82ucuqKWfzLhIyG8gJbbhl7jlDzPkwXM9luwyG2ij0IHoYvIrUl2mWtz98zVlq4ftRN38tT602qr8hQvNrz3l6q/oF6bAsaZ8LFuECTZeqMFCd04c4g6j264a8VK8+j25eo8/I02fx27hO2UBmtAEi1wWNUkudn9tiIXFvD25idZ4j0tczPD5X3bsm9UvlTt1VW7YqX+KHrN6NgDv8Jhax2G1dETMhjZGYgThUJieL2KN3Tptc6YDFDni932gsNP9R3uoQo1EtgU+kI9BKXrP0vnAdyxeTqfvAIaVWLcmKe8uPAqOHG3VWkcmxxNS7N2Dqc6b18Il+8R8Iw6XxkqiiSKt6vUduessxzG1pvGlE7VLcp7ONpcfjFEbM5SfReRGHQw8iBAVYrdADkHMrgBp9ZsiMlSFOjDzhMlLhcRlrE8g00mxp1tS3Qv7LmCPYhZJnNJvdPeWt2XqrM2Y7Y8PNBH//QyuoOzu5Fbgjhsl1Wv07Y7cUOMVtgr6ayLXmPrNjc+92jBemheNKDmQggnGR+qtU4BkfqPHqe9MoAQO/z+FfHNMiRXX3TFcGETF44=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1067402-68e0-4aca-3fcd-08de3ec30d73
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 05:54:20.0915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dE0zsVaWLSzY1vY04GPuIhrGERxawrXCPKgc1J5OApAhOZEq7/HiH6Mfsd+PETSPm1sXcP/vqxNA4b/Cnqd2NRDJgdjtdyoGWdvkjiPNMIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6966
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 spamscore=0 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2512190047
X-Authority-Analysis: v=2.4 cv=YJmSCBGx c=1 sm=1 tr=0 ts=6944e891 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=AWQ6OwgyuPrU-ki254MA:9 a=btWYfFMhfV_a-Ppm:21
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13654
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA0NiBTYWx0ZWRfX6LTGuUlag8r8
 78heFr4uNVss04tKeMsCrBcJNhEX/mHUd1WLSCFcFc0+esbnIMaS50CuVlnfAqFcov6N5t9HMo1
 Znh+KeaEeG9hRkI5z6E3N5/kFgLAbTgTTB+srdyifYu/KOcQhqjtWeRq4rBoktGfJ9vh036Uw+N
 Vp93Zs/mWjyWX2PetdKzLPP4ntft6qfT2TGJAZ0rX/avX1ElV/XHiJTyPCjfMArcsm4NJxX13Rq
 UGcsiwmQDIdeJ5EdXL23zreUppmCGhLZZHWT+nH/0uyd79PTp802gVSQNet0EBFafV654nGQ0IJ
 UmV4DvJosZogh+3lzz4RVMHFHpt8Rcvun7p+LF0oN9sxyaj2AyuBuDW0qfK/s09bWUw+/0fAKaM
 Zv/9PC8frmm8drLvaWwf8CDtFUmVQNiywHSdA334WnZJaSTO79nroMpgGUUfha7xAwJ60OMuV8X
 Alzxve1lwsqKwFqAUTGgcZpBt0mlkJJjwLiyEcbw=
X-Proofpoint-ORIG-GUID: 7i3ZqB9Wg99-59iKyJdkgysB6IuYqYuk
X-Proofpoint-GUID: 7i3ZqB9Wg99-59iKyJdkgysB6IuYqYuk

LGTM

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

On Thu, Dec 11, 2025 at 02:00:01PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> No Markdown formatting is performed inside ``.  So something like
> `[text](link)` is rendered literally as such.  But the `` is intended
> only for the text anyhow.  So, change to [`text`](link).
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  doc/userguide/reference/aggregation.md        |  33 ++--
>  .../dtrace-ref-PointersandScalarArrays.md     |   4 +-
>  .../reference/dtrace-ref-speculation.md       |   8 +-
>  doc/userguide/reference/dtrace_functions.md   | 157 +++++++++---------
>  .../reference/dtrace_providers_dtrace.md      |   6 +-
>  .../reference/dtrace_runtime_options.md       |   4 +-
>  doc/userguide/reference/function_copyinstr.md |   9 +-
>  doc/userguide/reference/function_func.md      |   4 +-
>  .../reference/function_speculation.md         |   2 +-
>  doc/userguide/reference/function_sym.md       |   3 +-
>  doc/userguide/reference/function_ufunc.md     |   3 +-
>  doc/userguide/reference/function_usym.md      |   3 +-
>  doc/userguide/reference/runtime_options.md    |   4 +-
>  13 files changed, 134 insertions(+), 106 deletions(-)
> 
> diff --git a/doc/userguide/reference/aggregation.md b/doc/userguide/reference/aggregation.md
> index 5fada5410..4f39f568d 100644
> --- a/doc/userguide/reference/aggregation.md
> +++ b/doc/userguide/reference/aggregation.md
> @@ -17,28 +17,32 @@ The *aggfunc* is one of the DTrace aggregating functions, and *args* is a comma-
>  
>  The following functions are aggregating functions that can be used in a program to collect data and present it in a meaningful way.
>  
> --   `[avg](aggregation_avg.md)`: Stores the arithmetic average of the specified expressions in an aggregation.
> +-   [`avg`](aggregation_avg.md): Stores the arithmetic average of the specified expressions in an aggregation.
>  
> --   `[count](aggregation_count.md)`: Stores an incremented count value in an aggregation.
> +-   [`count`](aggregation_count.md): Stores an incremented count value in an aggregation.
>  
> --   `[max](aggregation_max.md)`: Stores the largest value among the specified expressions in an aggregation.
> +-   [`max`](aggregation_max.md): Stores the largest value among the specified expressions in an aggregation.
>  
> --   `[min](aggregation_min.md)`: Stores the smallest value among the specified expressions in an aggregation.
> +-   [`min`](aggregation_min.md): Stores the smallest value among the specified expressions in an aggregation.
>  
> --   `[sum](aggregation_sum.md)`: Stores the total value of the specified expression in an aggregation.
> +-   [`sum`](aggregation_sum.md): Stores the total value of the specified expression in an aggregation.
>  
> --   `[stddev](aggregation_stddev.md)`: Stores the standard deviation of the specified expressions in an aggregation.
> +-   [`stddev`](aggregation_stddev.md): Stores the standard deviation of the specified expressions in an aggregation.
>  
> --   `[quantize](aggregation_quantize.md)`: Stores a power-of-two frequency distribution of the values of the specified expressions in an aggregation. An optional increment can be specified.
> +-   [`quantize`](aggregation_quantize.md): Stores a power-of-two frequency distribution of the values of the specified expressions in an aggregation.
> +    An optional increment can be specified.
>  
> --   `[lquantize](aggregation_lquantize.md)`: Stores the linear frequency distribution of the values of the specified expressions, sized by the specified range, in an aggregation.
> +-   [`lquantize`](aggregation_lquantize.md): Stores the linear frequency distribution of the values of the specified expressions,
> +    sized by the specified range, in an aggregation.
>  
> --   `[llquantize](aggregation_llquantize.md)`: Stores the log-linear frequency distribution in an aggregation.
> +-   [`llquantize`](aggregation_llquantize.md): Stores the log-linear frequency distribution in an aggregation.
>  
>  
>  ## Printing Aggregations <a id="dt_ref_aggr_print">
>  
> -By default, several aggregations are displayed in the order in which they're introduced in the D program. You can override this behavior by using the `[printa](function_printa.md)` function to print the aggregations. The `printa` function also lets you precisely format the aggregation data by using a format string.
> +By default, several aggregations are displayed in the order in which they're introduced in the D program.
> +You can override this behavior by using the [`printa`](function_printa.md) function to print the aggregations.
> +The `printa` function also lets you precisely format the aggregation data by using a format string.
>  
>  If an aggregation isn't formatted with a `printa` statement in a D program, the `dtrace` command snapshots the aggregation data and prints the results after tracing has completed, using the default aggregation format. If an aggregation is formatted with a `printa` statement, the default behavior is disabled. You can achieve the same results by adding the `printa(@*aggregation-name*)` statement to an `END` probe clause in a program.
>  
> @@ -46,7 +50,12 @@ The default output format for the `avg`, `count`, `min`, `max`, `stddev`, and `s
>  
>  ## Data Normalization <a id="dt_ref_aggr_dnorm">
>  
> -When aggregating data over some period, you might want to normalize the data based on some constant factor. This technique lets you compare disjointed data more easily. For example, when aggregating system calls, you might want to output system calls as a per-second rate instead of as an absolute value over the course of the run. The DTrace `[normalize](function_normalize.md)` function lets you normalize data in this way. The parameters to `normalize` are an aggregation and a normalization factor. The output of the aggregation shows each value divided by the normalization factor.
> +When aggregating data over some period, you might want to normalize the data based on some constant factor.
> +This technique lets you compare disjointed data more easily.
> +For example, when aggregating system calls,
> +you might want to output system calls as a per-second rate instead of as an absolute value over the course of the run.
> +The DTrace [`normalize`](function_normalize.md) function lets you normalize data in this way.
> +The parameters to `normalize` are an aggregation and a normalization factor.
> +The output of the aggregation shows each value divided by the normalization factor.
>  
>  **Parent topic:**[D Program Syntax Reference](../reference/d_program_syntax_reference.md)
> -
> diff --git a/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md b/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md
> index 8746ae2fd..78ebfa176 100644
> --- a/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md
> +++ b/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md
> @@ -31,7 +31,7 @@ In this example, the first fragment creates a D global variable pointer `q`. Bec
>  
>  ## Pointer Safety <a id="dt_ptrsafety_dlang">
>  
> -DTrace is a robust, safe environment for running D programs. You might write a buggy D program, but invalid D pointer accesses don't cause DTrace or the OS kernel to fail or crash in any way. Instead, the DTrace software detects any invalid pointer accesses, and returns a `BADADDR` fault; the current clause execution quits, an ERROR probe fires, and tracing continues unless the program called `[exit](function_exit.md)` for the ERROR probe.
> +DTrace is a robust, safe environment for running D programs. You might write a buggy D program, but invalid D pointer accesses don't cause DTrace or the OS kernel to fail or crash in any way. Instead, the DTrace software detects any invalid pointer accesses, and returns a `BADADDR` fault; the current clause execution quits, an ERROR probe fires, and tracing continues unless the program called [`exit`](function_exit.md) for the ERROR probe.
>  
>  Pointers are required in D because they're an intrinsic part of the OS's implementation in C, but DTrace implements the same kind of safety mechanisms that are found in the Java programming language to prevent buggy programs from affecting themselves or each other. DTrace's error reporting is similar to the runtime environment for the Java programming language that detects a programming error and reports an exception.
>  
> @@ -122,5 +122,5 @@ A pointer is an address that provides a translation within some *virtual address
>  
>  For example, if you use the `syscall` provider to instrument entry to a system call that takes a pointer to an integer or array of integers as an argument, such as, `pipe()`, it would not be valid to dereference that pointer or array using the `*` or `[]` operators because the address in question is an address in the address space of the user process that performed the system call. Applying the `*` or `[]` operators to this address in D would result in kernel address space access, which would result in an invalid address error or in returning unexpected data to the D program, depending on whether the address happened to match a valid kernel address.
>  
> -To access user-process memory from a DTrace probe, you must apply one of the `[copyin](function_copyin.md)`, `[copyinstr](function_copyinstr.md)`, or `[copyinto](function_copyinto.md)` functions. To avoid confusion, take care when writing D programs to name and comment variables storing user addresses appropriately. You can also store user addresses as `uintptr_t` so that you don't accidentally compile D code that dereferences them..
> +To access user-process memory from a DTrace probe, you must apply one of the [`copyin`](function_copyin.md), [`copyinstr`](function_copyinstr.md), or [`copyinto`](function_copyinto.md) functions. To avoid confusion, take care when writing D programs to name and comment variables storing user addresses appropriately. You can also store user addresses as `uintptr_t` so that you don't accidentally compile D code that dereferences them..
>  
> diff --git a/doc/userguide/reference/dtrace-ref-speculation.md b/doc/userguide/reference/dtrace-ref-speculation.md
> index f93053275..31d02c2eb 100644
> --- a/doc/userguide/reference/dtrace-ref-speculation.md
> +++ b/doc/userguide/reference/dtrace-ref-speculation.md
> @@ -27,7 +27,7 @@ Description
>  
>  </th></tr></thead><tbody><tr><td>
>  
> -`[speculation](../reference/function_speculation.md)`
> +[`speculation`](../reference/function_speculation.md)
>  
>  </td><td>
>  
> @@ -39,7 +39,7 @@ Returns an identifier for a new speculative buffer.
>  
>  </td></tr><tr><td>
>  
> -`[speculate](../reference/function_speculate.md)`
> +[`speculate`](../reference/function_speculate.md)
>  
>  </td><td>
>  
> @@ -51,7 +51,7 @@ Denotes that the remainder of the clause must be traced to the speculative buffe
>  
>  </td></tr><tr><td>
>  
> -`[commit](../reference/function_commit.md)`
> +[`commit`](../reference/function_commit.md)
>  
>  </td><td>
>  
> @@ -63,7 +63,7 @@ Commits the speculative buffer that's associated with ID.
>  
>  </td></tr><tr><td>
>  
> -`[discard](../reference/function_discard.md)`
> +[`discard`](../reference/function_discard.md)
>  
>  </td><td>
>  
> diff --git a/doc/userguide/reference/dtrace_functions.md b/doc/userguide/reference/dtrace_functions.md
> index 31e37091e..9a4f01363 100644
> --- a/doc/userguide/reference/dtrace_functions.md
> +++ b/doc/userguide/reference/dtrace_functions.md
> @@ -13,13 +13,13 @@ Functions can be grouped according to their general use case and might appear in
>  
>      -   [Default Action](dtrace-ref-DefaultAction.md): The default action applies when DTrace encounters an empty clause for a probe. The default action is to trace the enabled probe identifier \(EPID\).
>  
> -    -   `[printa](function_printa.md)`: Displays and controls the formatting of an aggregation
> +    -   [`printa`](function_printa.md): Displays and controls the formatting of an aggregation
>  
> -    -   `[printf](function_printf.md)`: Displays and controls the formatting of a string.
> +    -   [`printf`](function_printf.md): Displays and controls the formatting of a string.
>  
> -    -   `[trace](function_trace.md)`: Traces the result of an expression to the directed buffer.
> +    -   [`trace`](function_trace.md): Traces the result of an expression to the directed buffer.
>  
> -    -   `[tracemem](function_tracemem.md)`: Copies the specified number of bytes of data from an address in memory to the current buffer.
> +    -   [`tracemem`](function_tracemem.md): Copies the specified number of bytes of data from an address in memory to the current buffer.
>  
>  -   **Aggregation Functions**
>  
> @@ -27,33 +27,35 @@ Functions can be grouped according to their general use case and might appear in
>  
>      The following functions are aggregation functions:
>  
> -    -   `[avg](aggregation_avg.md)`: Stores the arithmetic average of the specified expressions in an aggregation.
> +    -   [`avg`](aggregation_avg.md): Stores the arithmetic average of the specified expressions in an aggregation.
>  
> -    -   `[count](aggregation_count.md)`: Stores an incremented count value in an aggregation.
> +    -   [`count`](aggregation_count.md): Stores an incremented count value in an aggregation.
>  
> -    -   `[max](aggregation_max.md)`: Stores the largest value among the specified expressions in an aggregation.
> +    -   [`max`](aggregation_max.md): Stores the largest value among the specified expressions in an aggregation.
>  
> -    -   `[min](aggregation_min.md)`: Stores the smallest value among the specified expressions in an aggregation.
> +    -   [`min`](aggregation_min.md): Stores the smallest value among the specified expressions in an aggregation.
>  
> -    -   `[sum](aggregation_sum.md)`: Stores the total value of the specified expression in an aggregation.
> +    -   [`sum`](aggregation_sum.md): Stores the total value of the specified expression in an aggregation.
>  
> -    -   `[stddev](aggregation_stddev.md)`: Stores the standard deviation of the specified expressions in an aggregation.
> +    -   [`stddev`](aggregation_stddev.md): Stores the standard deviation of the specified expressions in an aggregation.
>  
> -    -   `[quantize](aggregation_quantize.md)`: Stores a power-of-two frequency distribution of the values of the specified expressions in an aggregation. An optional increment can be specified.
> +    -   [`quantize`](aggregation_quantize.md): Stores a power-of-two frequency distribution of the values of the specified expressions in an aggregation.
> +         An optional increment can be specified.
>  
> -    -   `[lquantize](aggregation_lquantize.md)`: Stores the linear frequency distribution of the values of the specified expressions, sized by the specified range, in an aggregation.
> +    -   [`lquantize`](aggregation_lquantize.md): Stores the linear frequency distribution of the values of the specified expressions,
> +         sized by the specified range, in an aggregation.
>  
> -    -   `[llquantize](aggregation_llquantize.md)`: Stores the log-linear frequency distribution in an aggregation.
> +    -   [`llquantize`](aggregation_llquantize.md): Stores the log-linear frequency distribution in an aggregation.
>  
>      The following functions aren't aggregating functions but work on aggregations:
>  
> -    -   `[clear](function_clear.md)`: Clears the values from an aggregation while retaining aggregation keys.
> +    -   [`clear`](function_clear.md): Clears the values from an aggregation while retaining aggregation keys.
>  
> -    -   `[denormalize](function_denormalize.md)`: Removes the normalization that's applied to a specified aggregation.
> +    -   [`denormalize`](function_denormalize.md): Removes the normalization that's applied to a specified aggregation.
>  
> -    -   `[normalize](function_normalize.md)`: Divides an aggregation value by a specified normalization factor.
> +    -   [`normalize`](function_normalize.md): Divides an aggregation value by a specified normalization factor.
>  
> -    -   `[printa](function_printa.md)`: Displays and controls the formatting of an aggregation
> +    -   [`printa`](function_printa.md): Displays and controls the formatting of an aggregation
>  
>  -   **Speculation Functions**
>  
> @@ -61,13 +63,14 @@ Functions can be grouped according to their general use case and might appear in
>  
>      The following functions are speculation functions:
>  
> -    -   `[speculation](function_speculation.md)`: Creates a speculative trace buffer and returns its ID.
> +    -   [`speculation`](function_speculation.md): Creates a speculative trace buffer and returns its ID.
>  
> -    -   `[speculate](function_speculate.md)`: A special function that causes DTrace to switch to using a speculation buffer identified by the specified ID for the remainder of a clause.
> +    -   [`speculate`](function_speculate.md): A special function that causes DTrace to switch to using
> +        a speculation buffer identified by the specified ID for the remainder of a clause.
>  
> -    -   `[commit](function_commit.md)`: Commits the speculative buffer, specified by ID, to the principal buffer.
> +    -   [`commit`](function_commit.md): Commits the speculative buffer, specified by ID, to the principal buffer.
>  
> -    -   `[discard](function_discard.md)`: Discards a speculative buffer specified by the provided speculation ID.
> +    -   [`discard`](function_discard.md): Discards a speculative buffer specified by the provided speculation ID.
>  
>  -   **String Manipulation Functions**
>  
> @@ -81,33 +84,33 @@ Functions can be grouped according to their general use case and might appear in
>  
>      The following string manipulation functions are available:
>  
> -    -   `[index](function_index.md)`: Finds the first occurrence of a substring within a string.
> +    -   [`index`](function_index.md): Finds the first occurrence of a substring within a string.
>  
> -    -   `[rindex](function_rindex.md)`: Finds the last occurrence of a specific substring within a string.
> +    -   [`rindex`](function_rindex.md): Finds the last occurrence of a specific substring within a string.
>  
> -    -   `[lltostr](function_lltostr.md)`: Converts an unsigned 64-bit integer to a string.
> +    -   [`lltostr`](function_lltostr.md): Converts an unsigned 64-bit integer to a string.
>  
> -    -   `[strchr](function_strchr.md)`: Returns a substring that begins at the first matching occurrence of a specified character in a string.
> +    -   [`strchr`](function_strchr.md): Returns a substring that begins at the first matching occurrence of a specified character in a string.
>  
> -    -   `[strjoin](function_strjoin.md)`: Concatenates two specified strings and returns the resulting string.
> +    -   [`strjoin`](function_strjoin.md): Concatenates two specified strings and returns the resulting string.
>  
> -    -   `[strlen](function_strlen.md)`: Returns the length of a string in bytes.
> +    -   [`strlen`](function_strlen.md): Returns the length of a string in bytes.
>  
> -    -   `[strrchr](function_strrchr.md)`: Returns a substring that begins at the last matching occurrence of a specified character in a string.
> +    -   [`strrchr`](function_strrchr.md): Returns a substring that begins at the last matching occurrence of a specified character in a string.
>  
> -    -   `[strstr](function_strstr.md)`: Returns a substring starting at first occurrence of a specified substring within a string.
> +    -   [`strstr`](function_strstr.md): Returns a substring starting at first occurrence of a specified substring within a string.
>  
> -    -   `[strtok](function_strtok.md)`: Parse a string into a sequence of tokens using a specified delimiter.
> +    -   [`strtok`](function_strtok.md): Parse a string into a sequence of tokens using a specified delimiter.
>  
> -    -   `[substr](function_substr.md)`: Returns the substring from a string at a specified index position.
> +    -   [`substr`](function_substr.md): Returns the substring from a string at a specified index position.
>  
>  -   **File Path Manipulation Functions**
>  
>      Similar to string manipulation functions, file path manipulation functions act on file paths or can provide the path name for a specified pointer. Some of these functions have analogs in the system library calls described in section 3 of the Linux manual pages.
>  
> -    -   `[basename](function_basename.md)`: Returns a string excluding any prefix ending in `/`.
> +    -   [`basename`](function_basename.md): Returns a string excluding any prefix ending in `/`.
>  
> -    -   `[dirname](function_dirname.md)`: Returns the path up to the last level of a specified string.
> +    -   [`dirname`](function_dirname.md): Returns the path up to the last level of a specified string.
>  
>  -   **Integer Conversion Functions**
>  
> @@ -115,35 +118,38 @@ Functions can be grouped according to their general use case and might appear in
>  
>      The following integer conversion functions are available:
>  
> -    -   `[htonl](function_htonl.md)`: Converts an unsigned 32-bit long integer from host byte order to network byte order.
> +    -   [`htonl`](function_htonl.md): Converts an unsigned 32-bit long integer from host byte order to network byte order.
>  
> -    -   `[htonll](function_htonll.md)`: Converts an unsigned 64-bit long integer from host byte order to network byte order.
> +    -   [`htonll`](function_htonll.md): Converts an unsigned 64-bit long integer from host byte order to network byte order.
>  
> -    -   `[htons](function_htons.md)`: Converts a short 16-bit unsigned integer from host byte order to network byte order.
> +    -   [`htons`](function_htons.md): Converts a short 16-bit unsigned integer from host byte order to network byte order.
>  
> -    -   `[ntohl](function_ntohl.md)`: Converts a 32-bit long integer from network byte order to host byte order.
> +    -   [`ntohl`](function_ntohl.md): Converts a 32-bit long integer from network byte order to host byte order.
>  
> -    -   `[ntohll](function_ntohll.md)`: Converts a 64-bit long integer from network byte order to host byte order.
> +    -   [`ntohll`](function_ntohll.md): Converts a 64-bit long integer from network byte order to host byte order.
>  
> -    -   `[ntohs](function_ntohs.md)`: Converts a short 16-bit integer from network byte order to host byte order.
> +    -   [`ntohs`](function_ntohs.md): Converts a short 16-bit integer from network byte order to host byte order.
>  
>  -   **Copying Functions**
>  
>      Copying functions are functions that relate to copying information between memory addresses and DTrace buffers. Some of these functions are also considered process destructive functions because they change data in memory for a running process. Destructive functions must be explicitly enabled in DTrace.
>  
> -    -   `[alloca](function_alloca.md)`: Allocates memory and returns a pointer.
> +    -   [`alloca`](function_alloca.md): Allocates memory and returns a pointer.
>  
> -    -   `[bcopy](function_bcopy.md)`: Copies a specified size in bytes from a specified source address outside of scratch memory to a destination address inside scratch memory.
> +    -   [`bcopy`](function_bcopy.md): Copies a specified size in bytes from a specified source
> +        address outside of scratch memory to a destination address inside scratch memory.
>  
> -    -   `[copyin](function_copyin.md)`: Copies the specified size from the user address to a DTrace buffer and returns the address of the buffer.
> +    -   [`copyin`](function_copyin.md): Copies the specified size from the user address to a DTrace buffer and returns the address of the buffer.
>  
> -    -   `[copyinstr](function_copyinstr.md)`: Copies a null-terminated C string from the specified user address to a DTrace buffer and returns the address of the buffer.
> +    -   [`copyinstr`](function_copyinstr.md): Copies a null-terminated C string from the specified
> +        user address to a DTrace buffer and returns the address of the buffer.
>  
> -    -   `[copyinto](function_copyinto.md)`: Copies the specified size in bytes from the specified user address into the DTrace scratch buffer and returns the buffer address.
> +    -   [`copyinto`](function_copyinto.md): Copies the specified size in bytes from the specified
> +        user address into the DTrace scratch buffer and returns the buffer address.
>  
> -    -   `[copyout](function_copyout.md)`: Copies the specified size from the specified DTrace buffer to the specified user space address.
> +    -   [`copyout`](function_copyout.md): Copies the specified size from the specified DTrace buffer to the specified user space address.
>  
> -    -   `[copyoutstr](function_copyoutstr.md)`: Copies a specified string to a specified user space address.
> +    -   [`copyoutstr`](function_copyoutstr.md): Copies a specified string to a specified user space address.
>  
>  -   **Lock Analysis Functions**
>  
> @@ -151,19 +157,19 @@ Functions can be grouped according to their general use case and might appear in
>  
>      The following lock analysis functions are available:
>  
> -    -   `[mutex\_owned](function_mutex_owned.md)`: Checks whether a thread holds the specified kernel mutex.
> +    -   [`mutex_owned`](function_mutex_owned.md): Checks whether a thread holds the specified kernel mutex.
>  
> -    -   `[mutex\_owner](function_mutex_owner.md)`: Returns the thread pointer to the current owner of the specified kernel mutex.
> +    -   [`mutex_owner`](function_mutex_owner.md): Returns the thread pointer to the current owner of the specified kernel mutex.
>  
> -    -   `[mutex\_type\_adaptive](function_mutex_type_adaptive.md)`: Returns a non zero value if a specified kernel mutex is adaptive.
> +    -   [`mutex_type_adaptive`](function_mutex_type_adaptive.md): Returns a non zero value if a specified kernel mutex is adaptive.
>  
> -    -   `[mutex\_type\_spin](function_mutex_type_spin.md)`: Returns a non zero value if a specified kernel mutex is a spin mutex.
> +    -   [`mutex_type_spin`](function_mutex_type_spin.md): Returns a non zero value if a specified kernel mutex is a spin mutex.
>  
> -    -   `[rw\_iswriter](function_rw_iswriter.md)`: Checks whether a writer is holding or waiting for the specified reader-writer lock.
> +    -   [`rw_iswriter`](function_rw_iswriter.md): Checks whether a writer is holding or waiting for the specified reader-writer lock.
>  
> -    -   `[rw\_read\_held](function_rw_read_held.md)`: Checks whether the specified reader-writer lock is held by a reader.
> +    -   [`rw_read_held`](function_rw_read_held.md): Checks whether the specified reader-writer lock is held by a reader.
>  
> -    -   `[rw\_write\_held](function_rw_write_held.md)`: Checks whether the specified reader-writer lock is held by a writer.
> +    -   [`rw_write_held`](function_rw_write_held.md): Checks whether the specified reader-writer lock is held by a writer.
>  
>  -   **Symbolic Names and Stack Analysis Functions**
>  
> @@ -171,37 +177,37 @@ Functions can be grouped according to their general use case and might appear in
>  
>      The following functions return information about stack and addresses:
>  
> -    -   `[stack](function_stack.md)`: Records a stack trace to the buffer.
> +    -   [`stack`](function_stack.md): Records a stack trace to the buffer.
>  
> -    -   `[func](function_func.md)`: Prints the symbol for a specified kernel space address. An alias for `sym`.
> +    -   [`func`](function_func.md): Prints the symbol for a specified kernel space address. An alias for `sym`.
>  
> -    -   `[mod](function_mod.md)`: Prints the module name that corresponds to a specified kernel space address.
> +    -   [`mod`](function_mod.md): Prints the module name that corresponds to a specified kernel space address.
>  
> -    -   `[sym](function_sym.md)`: Prints the symbol for a specified kernel space address. An alias for `func`.
> +    -   [`sym`](function_sym.md): Prints the symbol for a specified kernel space address. An alias for `func`.
>  
> -    -   `[ustack](function_ustack.md)`: Records a user stack trace to the directed buffer.
> +    -   [`ustack`](function_ustack.md): Records a user stack trace to the directed buffer.
>  
> -    -   `[uaddr](function_uaddr.md)`: Prints the symbol for a specified address.
> +    -   [`uaddr`](function_uaddr.md): Prints the symbol for a specified address.
>  
> -    -   `[ufunc](function_ufunc.md)`: Prints the symbol for a specified user space address. An alias for `usym`.
> +    -   [`ufunc`](function_ufunc.md): Prints the symbol for a specified user space address. An alias for `usym`.
>  
> -    -   `[umod](function_umod.md)`: Prints the module name that corresponds to a specified user space address.
> +    -   [`umod`](function_umod.md): Prints the module name that corresponds to a specified user space address.
>  
> -    -   `[usym](function_usym.md)`: Prints the symbol for a specified address. An alias for `ufunc`.
> +    -   [`usym`](function_usym.md): Prints the symbol for a specified address. An alias for `ufunc`.
>  
>  -   **General System Functions**
>  
>      DTrace includes several functions to obtain information from the system or which are generalized for different use cases. Functions in this category include:
>  
> -    -   `[getmajor](function_getmajor.md)`: Returns the major device number for a specified device.
> +    -   [`getmajor`](function_getmajor.md): Returns the major device number for a specified device.
>  
> -    -   `[getminor](function_getminor.md)`: Returns the minor device number for a specified device
> +    -   [`getminor`](function_getminor.md): Returns the minor device number for a specified device
>  
> -    -   `[inet\_ntoa](function_inet_ntoa.md)`: Returns a dotted, quad decimal string for a pointer to an IPv4 address.
> +    -   [`inet_ntoa`](function_inet_ntoa.md): Returns a dotted, quad decimal string for a pointer to an IPv4 address.
>  
> -    -   `[progenyof](function_progenyof.md)`: Checks whether a calling process is in the progeny of a specified process ID.
> +    -   [`progenyof`](function_progenyof.md): Checks whether a calling process is in the progeny of a specified process ID.
>  
> -    -   `[rand](function_rand.md)`: Returns a pseudo random integer.
> +    -   [`rand`](function_rand.md): Returns a pseudo random integer.
>  
>  -   **Destructive Functions**
>  
> @@ -217,25 +223,25 @@ Functions can be grouped according to their general use case and might appear in
>  
>      These functions must be used with caution, as such functions can affect every process on the system and any other system, implicitly or explicitly, depending upon the affected system's network services.
>  
> -    -   `[copyout](function_copyout.md)`: Copies the specified size from the specified DTrace buffer to the specified user space address.
> +    -   [`copyout`](function_copyout.md): Copies the specified size from the specified DTrace buffer to the specified user space address.
>  
> -    -   `[copyoutstr](function_copyoutstr.md)`: Copies a specified string to a specified user space address.
> +    -   [`copyoutstr`](function_copyoutstr.md): Copies a specified string to a specified user space address.
>  
> -    -   `[freopen](function_freopen.md)`: Changes the file associated with `stdout` to a specified file.
> +    -   [`freopen`](function_freopen.md): Changes the file associated with `stdout` to a specified file.
>  
> -    -   `[ftruncate](function_ftruncate.md)`: Truncates the output stream on `stdout`.
> +    -   [`ftruncate`](function_ftruncate.md): Truncates the output stream on `stdout`.
>  
> -    -   `[raise](function_raise.md)`: Sends a specified signal to the running process.
> +    -   [`raise`](function_raise.md): Sends a specified signal to the running process.
>  
> -    -   `[system](function_system.md)`: Causes a specified program to be run on the system as if within a shell.
> +    -   [`system`](function_system.md): Causes a specified program to be run on the system as if within a shell.
>  
>  -   **Special Functions**
>  
>      DTrace also includes functions that change DTrace behavior such as exiting tracing altogether or changing DTrace runtime options.
>  
> -    -   `[exit](function_exit.md)`: Stops all tracing and exits to return an exit value.
> +    -   [`exit`](function_exit.md): Stops all tracing and exits to return an exit value.
>  
> -    -   `[setopt](function_setopt.md)`: Dynamically sets DTrace compiler or runtime options.
> +    -   [`setopt`](function_setopt.md): Dynamically sets DTrace compiler or runtime options.
>  
>  
>  -   **[Default Action](../reference/dtrace-ref-DefaultAction.md)**  
> @@ -396,4 +402,3 @@ Returns a string translation of a hardware address.
>   Records a user stack trace to the directed buffer.
>  -   **[usym](../reference/function_usym.md)**  
>   Prints the symbol for a specified address. An alias for `ufunc`.
> -
> diff --git a/doc/userguide/reference/dtrace_providers_dtrace.md b/doc/userguide/reference/dtrace_providers_dtrace.md
> index cfe485848..8b48e93ec 100644
> --- a/doc/userguide/reference/dtrace_providers_dtrace.md
> +++ b/doc/userguide/reference/dtrace_providers_dtrace.md
> @@ -62,7 +62,11 @@ As with the `BEGIN` probe, no arguments are defined for the `END` probe. The con
>  
>  **Note:**
>  
> -The `[exit](function_exit.md)` function causes tracing to stop and the `END` probe to fire. However, a delay exists between the invocation of the `exit` function and when the `END` probe fires. During this delay, no further probes can fire. After a probe invokes the `exit` function, the `END` probe isn't fired until DTrace determines that `exit` has been called and stops tracing. The rate at which the exit status is checked can be set by using `statusrate` option.
> +The [`exit`](function_exit.md) function causes tracing to stop and the `END` probe to fire.
> +However, a delay exists between the invocation of the `exit` function and when the `END` probe fires.
> +During this delay, no further probes can fire.
> +After a probe invokes the `exit` function, the `END` probe isn't fired until DTrace determines that `exit` has been called and stops tracing.
> +The rate at which the exit status is checked can be set by using `statusrate` option.
>  
>  ## ERROR Probe <a id="dt_ref_error_prov">
>  
> diff --git a/doc/userguide/reference/dtrace_runtime_options.md b/doc/userguide/reference/dtrace_runtime_options.md
> index f59223916..04e86ad62 100644
> --- a/doc/userguide/reference/dtrace_runtime_options.md
> +++ b/doc/userguide/reference/dtrace_runtime_options.md
> @@ -9,7 +9,8 @@ Options that can be specified when running the `dtrace` utility can be categoriz
>  
>  -   [Runtime Options](runtime_options.md): affect the runtime behavior of DTrace but which are often set at compile time.
>  
> --   [Dynamic Runtime Options](dynamic_runtime_options.md): affect the runtime behavior of DTrace but which can be changed while tracing, by using the `[setopt](function_setopt.md)` function.
> +-   [Dynamic Runtime Options](dynamic_runtime_options.md): affect the runtime behavior of DTrace but which can be changed while tracing,
> +    by using the [`setopt`](function_setopt.md) function.
>  
>  
>  -   **[Setting DTrace Compile-time and Runtime Options](../reference/setting_dtrace_compiler_and_runtime_options.md)**  
> @@ -20,4 +21,3 @@ Compile-time options can control how DTrace programs are compiled into eBPF code
>  Runtime options can control how the DTrace utility behaves.
>  -   **[Dynamic Runtime Options](../reference/dynamic_runtime_options.md)**  
>  Dynamic runtime options are specific to D programs themselves and are likely to change depending on program functionality and requirements.
> -
> diff --git a/doc/userguide/reference/function_copyinstr.md b/doc/userguide/reference/function_copyinstr.md
> index cfd8bb4d5..d531d25f6 100644
> --- a/doc/userguide/reference/function_copyinstr.md
> +++ b/doc/userguide/reference/function_copyinstr.md
> @@ -7,7 +7,13 @@ Copies a null-terminated C string from the specified user address to a DTrace bu
>  string copyinstr(uintptr_t *addr* [, size_t *size*])
>  ```
>  
> -The `copyinstr` function copies a null-terminated C string from the specified user address into a DTrace scratch buffer and returns the address of this buffer. The user address is interpreted as an address in the space of the process that's associated with the current thread. An optional maximum length parameter sets a limit on the number of bytes that are examined beyond the address. The resulting string is always null-terminated and the string's length is limited to the value set by the compiler and runtime `strsize` option. As with the `[copyin](function_copyin.md)` function, the specified address must correspond to a faulted-in page in the current process. If the address doesn't correspond to a faulted-in page, or if insufficient scratch memory is available, NULL is returned, and an error is generated.
> +The `copyinstr` function copies a null-terminated C string from the specified user address
> +into a DTrace scratch buffer and returns the address of this buffer.
> +The user address is interpreted as an address in the space of the process that's associated with the current thread.
> +An optional maximum length parameter sets a limit on the number of bytes that are examined beyond the address.
> +The resulting string is always null-terminated and the string's length is limited to the value set by the compiler and runtime `strsize` option.
> +As with the [`copyin`](function_copyin.md) function, the specified address must correspond to a faulted-in page in the current process.
> +If the address doesn't correspond to a faulted-in page, or if insufficient scratch memory is available, NULL is returned, and an error is generated.
>  
>  ## How to use copyinstr to copy a string from an address space for a process to the DTrace buffer
>  
> @@ -22,4 +28,3 @@ syscall::write:entry
>  ```
>  
>  **Parent topic:**[DTrace Function Reference](../reference/dtrace_functions.md)
> -
> diff --git a/doc/userguide/reference/function_func.md b/doc/userguide/reference/function_func.md
> index 2782268ad..593825739 100644
> --- a/doc/userguide/reference/function_func.md
> +++ b/doc/userguide/reference/function_func.md
> @@ -7,7 +7,9 @@ Prints the symbol for a specified kernel space address. An alias for `sym`.
>  _symaddr func(uintptr_t *addr*)
>  ```
>  
> -The `func` function is a data recording function that prints the symbol that corresponds to a specified kernel space address, *addr*. The `func` function is an alias for `[sym](function_sym.md)`.
> +The `func` function is a data recording function that prints the symbol
> +that corresponds to a specified kernel space address, *addr*.
> +The `func` function is an alias for [`sym`](function_sym.md).
>  
>  ## How the func function can return the symbol for a kernel space address
>  
> diff --git a/doc/userguide/reference/function_speculation.md b/doc/userguide/reference/function_speculation.md
> index 3a24c0ab1..91ed103ff 100644
> --- a/doc/userguide/reference/function_speculation.md
> +++ b/doc/userguide/reference/function_speculation.md
> @@ -7,7 +7,7 @@ Creates a speculative trace buffer and returns its ID.
>  int speculation(void)
>  ```
>  
> -The `speculation` function reserves a speculative trace buffer for use with `[speculate](function_speculate.md)` and returns an identifier for this buffer.
> +The `speculation` function reserves a speculative trace buffer for use with [`speculate`](function_speculate.md) and returns an identifier for this buffer.
>  
>  ## How to use speculation
>  
> diff --git a/doc/userguide/reference/function_sym.md b/doc/userguide/reference/function_sym.md
> index 8e26b5140..843488771 100644
> --- a/doc/userguide/reference/function_sym.md
> +++ b/doc/userguide/reference/function_sym.md
> @@ -7,7 +7,8 @@ Prints the symbol for a specified kernel space address. An alias for `func`.
>  _symaddr sym(uintptr_t *addr*)
>  ```
>  
> -The `sym` function is a data recording function that prints the symbol that corresponds to a specified kernel space address, *addr*. The `sym` function is an alias for `[func](function_func.md)`.
> +The `sym` function is a data recording function that prints the symbol that corresponds to a specified kernel space address, *addr*.
> +The `sym` function is an alias for [`func`](function_func.md).
>  
>  ## How the sym function can return the symbol for a kernel space address
>  
> diff --git a/doc/userguide/reference/function_ufunc.md b/doc/userguide/reference/function_ufunc.md
> index 7c78a1ae4..c8b59f2e6 100644
> --- a/doc/userguide/reference/function_ufunc.md
> +++ b/doc/userguide/reference/function_ufunc.md
> @@ -7,7 +7,8 @@ Prints the symbol for a specified user space address. An alias for `usym`.
>  _usymaddr ufunc(uintptr_t)
>  ```
>  
> -The `ufunc` function is a data recording function that prints the symbol that corresponds to a specified user space address. The `func` function is an alias for `[usym](function_usym.md)`.
> +The `ufunc` function is a data recording function that prints the symbol that corresponds to a specified user space address.
> +The `func` function is an alias for [`usym`](function_usym.md).
>  
>  ## How to use usym to obtain the symbol for an address
>  
> diff --git a/doc/userguide/reference/function_usym.md b/doc/userguide/reference/function_usym.md
> index 8c1061c5d..791f770b0 100644
> --- a/doc/userguide/reference/function_usym.md
> +++ b/doc/userguide/reference/function_usym.md
> @@ -7,7 +7,8 @@ Prints the symbol for a specified address. An alias for `ufunc`.
>  _usymaddr usym(uintptr_t)
>  ```
>  
> -The `usym` function prints the symbol for a specified address, which is analogous to how `[uaddr](function_uaddr.md)` works, but without the hexadecimal offsets. The `usym` function is an alias for `[ufunc](function_ufunc.md)`.
> +The `usym` function prints the symbol for a specified address, which is analogous to how [`uaddr`](function_uaddr.md) works,
> +but without the hexadecimal offsets. The `usym` function is an alias for [`ufunc`](function_ufunc.md).
>  
>  ## How to use usym to obtain the symbol for an address
>  
> diff --git a/doc/userguide/reference/runtime_options.md b/doc/userguide/reference/runtime_options.md
> index 88973dd8c..31b200604 100644
> --- a/doc/userguide/reference/runtime_options.md
> +++ b/doc/userguide/reference/runtime_options.md
> @@ -17,7 +17,7 @@ Runtime options can control how the DTrace utility behaves.
>  
>  -   **`bufsize=<size>`**
>  
> -    Runtime option that sets the principal buffer size. The default buffer size is set to 4 MB. This option is the same as running `dtrace` `-b`.
> +    Runtime option that sets the principal buffer size. The default buffer size is set to 4 MB. This option is the same as running `dtrace -b`.
>  
>  -   **`cleanrate=<time>`**
>  
> @@ -29,7 +29,7 @@ Runtime options can control how the DTrace utility behaves.
>  
>  -   **`destructive`**
>  
> -    Runtime option that permits destructive functions to run. This option is the same as running `dtrace` `-w`.
> +    Runtime option that permits destructive functions to run. This option is the same as running `dtrace -w`.
>  
>  -   **`dynvarsize=<size>`**
>  
> -- 
> 2.47.3
> 
