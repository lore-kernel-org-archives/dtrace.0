Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FA01F3D44
	for <dtrace@lists.linux.dev>; Fri, 31 Jan 2025 16:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738341467; cv=fail; b=Ye90EkUT29WgU1sUDDk5l1ffl/nN/JKyxcYTVSLP8D2IQAXuZXLnvzZupJ1jZfIS6DaYXYLfeFEQnMM50G6E847prdz8Nj5muLoNek9v/syPFullRJPsJchSAOpyy3fcd/vpa5YflGKvAiUXhe76OX72lxGjYmaTJwPvrpg+VZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738341467; c=relaxed/simple;
	bh=bxAUyHe6TVevsB5M7u4hiuPv/VV7LbYLh11RP4yZgW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uJeBi3dB2CU9e3qFcgIohA/foiUIn4Fr+a10/uxaY6HIZuRPNwm7kOxbfgvLajmFYzfWDzRP7++zXKv0vJsom2Rp/2qg0Ysp+H6e7W7JnQ0PxIxPYLjBgg+mWMloPwjbzh8VgzEvHOuLLEzjSNONY5K9Q3S3J+9jv0vsZvxHYhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JPlyeHGk; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Hzo4KLCA reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JPlyeHGk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Hzo4KLCA"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VFvOC2020792
	for <dtrace@lists.linux.dev>; Fri, 31 Jan 2025 16:37:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=gyl3UyO1Eql/xPuMqG9fqyPAuEk/cY1qzK+KipTPRa0=; b=
	JPlyeHGkpZYUpk0VkvJ8WJYHCRXa/RSuLUodcTXmCqoJZp8L2oMOLnkI5azrWcd6
	1skN/3XIZfLZk9ioXtom0EbUrkcsW0DklUum/RGzeusXt3OnjAjkcJcaeTDb7+pZ
	mK84AherlR7VFYMO7eQGTyQeje6kkg6e/pfpI5QSO9tBxwJPdEnoIvnq9vpFTfBE
	DKanab/4I/+/YEi1zfR+zDEpRhMgw9KRsSip5FllZT8N8M8TCzmAOYq8LJrSJVTd
	8idh6OzpGbAR+9AbCTvfgxx9UFhxx4ppMfF5UUuNT65MlH0oSWA1/mImQNxjrCsX
	QZ/TvmGUAa2+hRnhaqC9Jw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44h1kx02ru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 31 Jan 2025 16:37:41 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50VGJvHj032154
	for <dtrace@lists.linux.dev>; Fri, 31 Jan 2025 16:37:40 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2043.outbound.protection.outlook.com [104.47.70.43])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44gf944j8q-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 31 Jan 2025 16:37:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FvtadJLt+0bsG8tR2v28keb4L5JG9rfiVrSmCGxdL3TIDEi8EO5pT/GW1hWPQ6ekvkzMCr9pWJBL/c0rGy5l27+z6cJvq9g8p5h52h1A6C5J+LZH+hfNq4JssYderrpSENxqRN1GmTGKtpBGRWPqJeVjbfdSQIYwctV8mxBsTHWE+Q4PbCkufkUyo4GpBZfijRAcSQ5TRGMilEw/xH9BM6fYP32/s9qcuS1Gr7o0273vg/ZS83OTfKJSM+kSVRGa59ZlOW9Dj0HZ5tWqU73LDpXvbVw+/SmhgHkJyxBMeuWsV29CA9qbwmxhVHA8NKX0p+JQP49O+Ov8hJ9jdgPRdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRFEa9XRNet8ecCoLr4oScXwxqrwXa1syapmSxtP+WU=;
 b=dJ9BSSrRR2UEEnu+bRjdPprKUj7daXRgEqm22Nok6N6EaGq47VcElUU/QSr+j7PAhIEK4nA/1A9zWw/cjxm0Ac2aFT1VxZz3a5JTSXIsHlCCVI1lDIilu00J1hCjrt4NW/M7iFNv9iVed9plSjsAGIa9v0UPUWjeN9kcH0vrHpfi9aUYhzku/9AtNLU1el0AOP74WvwgGFK6TpZxNuoi4p99+ZvCN7ogeZ1dKuRX7/8pCQy68X3shSBpA5hKZ7ZdKYwMKpxq4D/2UCbFFk8hflxgfqAtrkXVD2sjgClhPjqqq2auWbWF7QfivoQCjgQU9AFU2rbkn4RqeTgTHGrzuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nRFEa9XRNet8ecCoLr4oScXwxqrwXa1syapmSxtP+WU=;
 b=Hzo4KLCA0E4HXFWg2XChcyQfnebaLKPocFVQi2eIvhvbVCCSEd9TPjfriYMeRBUQEPEOLW+8NXCMMGwbLcBA3kXXSFP0nURpj+BZeD04dmoZrCWH5PuTbl070G38oV63TTvdRaP0TOUiHMvQJvDb2eJ0ndgtNXQQ+MR44spdpps=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by PH0PR10MB4805.namprd10.prod.outlook.com (2603:10b6:510:3b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Fri, 31 Jan
 2025 16:37:37 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8398.014; Fri, 31 Jan 2025
 16:37:37 +0000
Date: Fri, 31 Jan 2025 11:37:32 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v2 4/6] procfs: implement d_execargs() for
 pr_psargs translator support
Message-ID: <Z5z8TG9TsewzE5dI@kvh-deb-bpf.us.oracle.com>
References: <PH8PR10MB6337029F91AD9127B9013409C2EE2@PH8PR10MB6337.namprd10.prod.outlook.com>
 <b5896523-3248-fea2-3a02-ba13353c52f0@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5896523-3248-fea2-3a02-ba13353c52f0@oracle.com>
X-ClientProxiedBy: BL6PEPF0001640D.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:14) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|PH0PR10MB4805:EE_
X-MS-Office365-Filtering-Correlation-Id: 90041955-b783-4f09-14cb-08dd42159229
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?DM6eQO8nz1QWlT7luFdwMOEIGUX5Xcr1ldAqiKT9VNrxu+ht9ryBS3O5SY?=
 =?iso-8859-1?Q?Wcst/yvsuT1PxOIWmOrlGTPXW/yiCj9i6roy2LxgCnh8E95Xvf0dUz4tuY?=
 =?iso-8859-1?Q?RB3G1EmEHZ3U5YvwureWoezHHl0RXxFrIlAlj6u869fDpT6qLY18Pg4EQC?=
 =?iso-8859-1?Q?XLL1/7+o4PaXcrSFf1blQfMMFhscLdaakaXRmwZqljICsKX8RrBmnpO7JL?=
 =?iso-8859-1?Q?xoPTS/bbmsF2ZmtZHWuS5IQ2vt3E9V67nSlguHhn6yNDrDyeVeYxLrg5hV?=
 =?iso-8859-1?Q?8x5eTaTDoEhNmEpPyXMHJw3oMXgXeu8Q8xyu16lF/cN8kFM93YsoMp+WJg?=
 =?iso-8859-1?Q?qM2bcqv1VAQDYMoyR7gJBjvBUi5bVWQ0eQ2MnjC4ajep4a+1zHtX3LGpK0?=
 =?iso-8859-1?Q?/c4tuvAD5XFILmegrs/1PRpY1TgH2hmP3QLATVy30iTdNqDwHYNMZEIZKz?=
 =?iso-8859-1?Q?zmwhMZ5zElPSGQcnP9wALCnZOEt3WtpBCe036WDFv5XCSVOtEueD0Gsd9C?=
 =?iso-8859-1?Q?A3/nwa4kzmgdscdEmKzdRgCXuIRR07KASvXzyPqWpzNbwBKLaoLt2P2fqn?=
 =?iso-8859-1?Q?SXksjxfqBbNZ20khno1tqFCSFW48bJ6oB/mrJ7aGbznggpmWlTR8dR5FmA?=
 =?iso-8859-1?Q?l0ukvoHmaIG7PXYA//JSZ5xZuEI4HU2qykOg3DYITZXSEBMZSUg2csZM63?=
 =?iso-8859-1?Q?S+dBncq2KZSsCFPLj6UIxbaSUQJxzqhBNqJb2L/FfrBgRL1Om9a8WiyBiI?=
 =?iso-8859-1?Q?pXOf5MmhsPOVQ3lbNfWjym/iqf4sxAarCNV4JaX+UxQjD2DIz9Alrw1b5B?=
 =?iso-8859-1?Q?h5BvEYgK0+c3xV3EwMEzICbkjl+fjQ3m2izs1YoqyXjKk0LAyeoHUP4+pF?=
 =?iso-8859-1?Q?RW0EfTFKgsVgM1dG+xHhPzHtm7yn4jh0AFeOBvDK78NtTRPB/66utQa9xJ?=
 =?iso-8859-1?Q?WEEZB8KoAHpSYMRHi0G0HSpt0V/14eoRgIVHMVp54s2t0uV2uCTScHmmaP?=
 =?iso-8859-1?Q?C5Sh+OHkYscQ6s5k8XS40iyY/SQiyMymyjK3+b8XJlUAcL9Rrm+AbqKH+w?=
 =?iso-8859-1?Q?ZDfiEOCkDDLi68djyg3i895uIP+kb3EsN4eFbvfy5V6Iol0C5fewYgFeqF?=
 =?iso-8859-1?Q?yTqDzJbWKfijZSrT9/gwwWmgr4ggYwNV6nBRTL9d1rD+8owXHvsnoB6rhB?=
 =?iso-8859-1?Q?PWtnAuhSD1aCgwxxngqclu8rT4jldy4XpxxXfrETWyDSLqCiTVdVsAneOc?=
 =?iso-8859-1?Q?YgMQT1AGy/YANEC/xzAOqvm2ZK+Ui3xROh1fTUXyZlpCK/MYa++RWsEosv?=
 =?iso-8859-1?Q?uuIoQ20NeAYKRHivQqjZg8kepcoDFYzy76Bv4f9jzRHgzWuqK8cy1qCPKI?=
 =?iso-8859-1?Q?6E0yLNpw/r/Fkg1l+RDqwcCU+Xmkxt/wMJb2Ma+WhYxlLdWMpl/q7q3C7p?=
 =?iso-8859-1?Q?1ge+T8ESjQ7pnzj5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?ZfEo0CxqwdVAkQwGzVmWwnk4uFog2GR8d8hN5KLR1bgLviorVvbt6DEsPY?=
 =?iso-8859-1?Q?zAv3C8PgEQO/VRUdSUrGIPsKmEMnW50E9IQunB1s5D9+4V71XyZv+g4Pmm?=
 =?iso-8859-1?Q?ldDqQQTz1Kb6j/4A4n46kvW+p1PbhSTm3fsK0+7YuuF/pe7GFaj/MAa8nX?=
 =?iso-8859-1?Q?OwhIxb2qmIC6grB1YMeEXIh2Y/y9QlLTiPo/YzmXPdAhZq/7V+Oo8HlQMC?=
 =?iso-8859-1?Q?uFhVrsgJFuhR5pAnPVlAPIb85f2/BHrrvr3uXZLnREbmDcqxiRNxvW12b3?=
 =?iso-8859-1?Q?c5QcdTpbU5hwuP3yBbQQ6riHARAt7o1x2AMU65KxmCYB2PTlhG3ejFZTBR?=
 =?iso-8859-1?Q?rGrS7Nj8iPvUsmwPAWE3/zhfQB8+BRoHreRwdJjJmc7VtoR7t6vd+KSaLO?=
 =?iso-8859-1?Q?vRhAv3a6mRI6WMXla5mHmdu0dl694wu7bbtVii9HeBwYBDb69QIAbXjoQ2?=
 =?iso-8859-1?Q?DmeQSscTX6qtO/6mwyzmNs3Rm3aHWAzZRT3VZ1xBw1W/WLOlQ/tTtYFYTB?=
 =?iso-8859-1?Q?0k03kp9PQQrRupVbvDfJmQGN1IxPsLjRISbmDvx6pXfB8czyp+MEpTJ/z0?=
 =?iso-8859-1?Q?lC814RT2On3iYGZO2tQPS6DgX4R9hjUH2Dc0UKKmitfoaGfmf5KUsyZ0fF?=
 =?iso-8859-1?Q?RIcYjwJVYdC72eeUQV8+yrkyhb+kA8aiq1gbzE+BD5Zhu8aAyOm1ge8iIv?=
 =?iso-8859-1?Q?1PGVJxrTcYuoZcBQdyNtVlWuzeWFKM2kXA2tEA81smnawnmTeLuQsGJ1qq?=
 =?iso-8859-1?Q?SnldvB+aCb3gno6/mFFou9VPpwVCSsAeIPA1+PuB30CMbEnqUkCaq+GJIN?=
 =?iso-8859-1?Q?xOFRNtHCu4El5L3WUxRq/MAbXG4izRLDdd1YCVwgTY+5ZnixXzh63S8jgZ?=
 =?iso-8859-1?Q?AA8LooodQl8Zr7lFh4x4109M82qGoszn5ITET0r2yPDPmPxZ/a5vRqEZPw?=
 =?iso-8859-1?Q?PUU5LqQYkhPDEJ035clD0GBsCwekTWDI6QDhYJ2sllBHPqq0wMHD7IMfgh?=
 =?iso-8859-1?Q?SDCaFphwXFGSU/v3e0SN13DBELlLT+ut8ElYB5nzCbnyOPCeZWUAazOjvD?=
 =?iso-8859-1?Q?E9iciOHse5YUWXdYRPmzCBGMVRLfQ8rNfEzuGuArxNAE+6LVCoh8FM2BWL?=
 =?iso-8859-1?Q?ee6KxJQV7LWSqbGUuAVjYieFLp6hq4QYcuNr0KBNk8n/hEIs9JFf6BlKdE?=
 =?iso-8859-1?Q?VSUuPCSqvL3nmISHNSyNFQRhGz4rMpilJCFqQVG0ds8GEZsdcckHx0SSv7?=
 =?iso-8859-1?Q?Habb6gvuLqNYWd5hGhxomg8VPVCnWH60Vspf2NyRetfJfYjspvdl97pMlh?=
 =?iso-8859-1?Q?tODwJN2FL8ExLYEoV4D66RUvJv2lMYvfKq+PGuEj7SVuT1w+ym15MHFi0F?=
 =?iso-8859-1?Q?+XfsI56dFd/CL3UvrT8Y9JNIb0i9D3/haBbi58ow4F9Z8fKKHiNU48SmtF?=
 =?iso-8859-1?Q?dAnGXFVlM5d3OfKDVKO2hBxowS/LcK+z5khxxDmgf7hegnplJyb45z9I5g?=
 =?iso-8859-1?Q?CFjbqfzsWyYF1aAbVaEnpqwVJgBS7DiW7XDlmyhyNRNhoT4DuG1wqIT5fu?=
 =?iso-8859-1?Q?413osw8wHczzkdnBx8dzTAEuLT+uMjvYZZWEDB2nPiaD8Q6jmmw3TXgZvd?=
 =?iso-8859-1?Q?RuY01ABvSR/APzyrP40VUdrS5oaQZquGgKJodyfbpFnk7uK3njZR+XAA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CyR6s6n2mfm4TKVO/ZrFs8qKrgPaXIa0J8bFVS8fKrFl3pMLMPpvVKru30cbNHyteXUz9wkpGx9hEK+DTf3X8gYX7PsYLSRaAZxQX7iSWz2U+YZkXc+0NQwLVhcWOAQyFY1sQ2jKRE52wkN8QEddFPPHkMTnSqly4rvFzQTBobJUeaum0rTnFEsDAOuDcODeggERwSv+I1ekiCwbIUIqCV9HiybtuC0I5XTwo6s4Ird/LHmnCydITPfH44V40AAyWsLWcgwyDgpDvmjAlMtmxhpkBr1AYY2pummA1jazVagzIJ02UvUqxK0bNyHb65LfXas41dNMqbcxe9cl07A6Jw9tn5Som6ztJMw88hGwMxvlkKh7mgzKbDL5g5aDD3+Tkw73ifI5fHpDjxc7jUbIglOGAyLzPvctYqP3N0lMmb80QVl2W6b7qV1Ln6+qIXZRSapij8eRLZAph1uFaHfKw6WKj8dVMkDL/MNwaRvSFPHPOAA/MT4YJeq1fKupzs1ybFx/jefCIbNsnQXfIc8zC7XAhPWcTFr8acdSMgTa4ItqK8RxAIgwbNGWOzfnj+dgeJ0tNhD1eFoeuaT86zJbZifPQgAB1RMNVrASbmBZ2KM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90041955-b783-4f09-14cb-08dd42159229
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 16:37:37.2881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LOGE/dv4AeQWZIJlBBBO4ZcaI4/wFXj5Ma1+idJ5Nf73LjfG8Z1NRqz8iwNjMuUevD34k/+qdJznfLlRWuvsKUofk3zATfHn8il6dfSH4OI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4805
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_05,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0 mlxscore=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2501310127
X-Proofpoint-GUID: AkyhTsGJTe6jHlFf6ralrEUrhToTtmRY
X-Proofpoint-ORIG-GUID: AkyhTsGJTe6jHlFf6ralrEUrhToTtmRY

On Thu, Jan 30, 2025 at 02:22:44PM -0500, Eugene Loh wrote:
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

Thanks.

> For
> test/unittest/funcs/d_execargs/tst.d_execargs.d
> test/unittest/proc/tst.pr_psargs.d
> how about a few more arguments?  E.g.,
> system("/bin/echo TEST abcde fghijkl");
> (I don't have anything particular in mind that this might catch. Just trying
> to poke a little harder.)

Sure, although it does not really improve the testing because we are looping
over all characters, changing '\0' into ' ', except for the last one.  If it
works for one it works for all, but I also do not mind adding a few extra
arguments.

> For bpf/d_execargs.S, how about ' ' instead of 32 (in that substitution
> loop).

OK

> For bpf/d_execargs.S, a few more comments would be nice.  Per your taste, of
> course.  But for me, e.g.,
> 
> - There should be a comment with the prototype of the function.
>   I think most other bpf/*.S files do this.

Sure.

> - One input arg is referred to as "args"... Most other bpf/*.S functions
>   refer to this as "dst" or something.  To me that makes more sense
>   since, as far as d_execargs() is concerned, this arg is the dest
>   location.

I prefer using 'args' here because this is a less generic function.  It is not
just a destination string but it is a destination string that has a particular
meaning/purpose.  A more generic name list 'dst' seems to be less useful here,
I think.

> - Comments refer to T.  This makes sense for the translators I
>   guess, but maybe saying it's the task struct or something.

That will be clear from adding the prototype.

> - Maybe it'd be helpful to lay out the strategy for how the registers
>   are being used?  E.g., %r9 points to the dest location, but meanwhile
>   used for scratch space.  %r6 is the pointer to memory we're accessing
>   so that, in case of probe_read() error, we know which address to report.

The code already includes comments showing what registers are for at the
places where they get assigned to.  I think adding more would merely add
clutter at this point.
> 
> On 1/29/25 02:00, Kris Van Hees via DTrace-devel wrote:
> > Implement d_execargs() to provide task argument string (pr_psargs)
> > for the psinfo translator.  It takes a task (struct task_struct) as
> > argument and returns a string.
> > 
> > psinfo->pr_psargs now simply calls d_execargs(T).
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   bpf/Build                                     |  1 +
> >   bpf/d_execargs.S                              | 91 +++++++++++++++++++
> >   dlibs/aarch64/5.11/procfs.d                   |  4 +-
> >   dlibs/aarch64/5.12/procfs.d                   |  4 +-
> >   dlibs/aarch64/5.14/procfs.d                   |  4 +-
> >   dlibs/aarch64/5.16/procfs.d                   |  4 +-
> >   dlibs/aarch64/5.2/procfs.d                    |  4 +-
> >   dlibs/aarch64/5.6/procfs.d                    |  4 +-
> >   dlibs/aarch64/6.1/procfs.d                    |  4 +-
> >   dlibs/aarch64/6.10/procfs.d                   |  4 +-
> >   dlibs/x86_64/5.11/procfs.d                    |  4 +-
> >   dlibs/x86_64/5.12/procfs.d                    |  4 +-
> >   dlibs/x86_64/5.14/procfs.d                    |  4 +-
> >   dlibs/x86_64/5.16/procfs.d                    |  4 +-
> >   dlibs/x86_64/5.2/procfs.d                     |  4 +-
> >   dlibs/x86_64/5.6/procfs.d                     |  4 +-
> >   dlibs/x86_64/6.1/procfs.d                     |  4 +-
> >   dlibs/x86_64/6.10/procfs.d                    |  4 +-
> >   include/dtrace/dif_defines.h                  |  7 +-
> >   libdtrace/dt_bpf.h                            | 21 +++--
> >   libdtrace/dt_cc.c                             | 33 ++++++-
> >   libdtrace/dt_cg.c                             |  9 +-
> >   libdtrace/dt_dlibs.c                          |  3 +
> >   libdtrace/dt_open.c                           |  2 +
> >   libdtrace/procfs.d.in                         |  4 +-
> >   .../d_execargs/err.D_PROTO_ARG.scalar_arg.d   | 16 ++++
> >   .../d_execargs/err.D_PROTO_ARG.scalar_arg.r   |  4 +
> >   .../d_execargs/err.D_PROTO_ARG.string_arg.d   | 16 ++++
> >   .../d_execargs/err.D_PROTO_ARG.string_arg.r   |  4 +
> >   .../d_execargs/err.D_PROTO_ARG.wrong_ptr.d    | 16 ++++
> >   .../d_execargs/err.D_PROTO_ARG.wrong_ptr.r    |  4 +
> >   .../d_execargs/err.D_PROTO_LEN.missing_arg.d  | 16 ++++
> >   .../d_execargs/err.D_PROTO_LEN.missing_arg.r  |  2 +
> >   .../err.D_PROTO_LEN.too_many_args.d           | 16 ++++
> >   .../err.D_PROTO_LEN.too_many_args.r           |  2 +
> >   .../funcs/d_execargs/tst.d_execargs.d         | 31 +++++++
> >   .../funcs/d_execargs/tst.d_execargs.r         |  2 +
> >   test/unittest/proc/tst.pr_psargs.d            | 31 +++++++
> >   test/unittest/proc/tst.pr_psargs.r            |  9 ++
> >   39 files changed, 339 insertions(+), 65 deletions(-)
> >   create mode 100644 bpf/d_execargs.S
> >   create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.d
> >   create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.r
> >   create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.d
> >   create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.r
> >   create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.d
> >   create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.r
> >   create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.d
> >   create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.r
> >   create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.d
> >   create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.r
> >   create mode 100644 test/unittest/funcs/d_execargs/tst.d_execargs.d
> >   create mode 100644 test/unittest/funcs/d_execargs/tst.d_execargs.r
> >   create mode 100644 test/unittest/proc/tst.pr_psargs.d
> >   create mode 100644 test/unittest/proc/tst.pr_psargs.r
> > 
> > diff --git a/bpf/Build b/bpf/Build
> > index 3e43f4b6..9355326c 100644
> > --- a/bpf/Build
> > +++ b/bpf/Build
> > @@ -24,6 +24,7 @@ bpf_dlib_SOURCES = \
> >   	agg_lqbin.c agg_qbin.c \
> >   	basename.S \
> >   	cleanpath.S \
> > +	d_execargs.S \
> >   	dirname.S \
> >   	get_agg.c \
> >   	get_bvar.c \
> > diff --git a/bpf/d_execargs.S b/bpf/d_execargs.S
> > new file mode 100644
> > index 00000000..3a5b1270
> > --- /dev/null
> > +++ b/bpf/d_execargs.S
> > @@ -0,0 +1,91 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2025, Oracle and/or its affiliates.
> > + */
> > +
> > +#include <bpf_asm_helpers.h>
> > +#include <dtrace/faults_defines.h>
> > +
> > +	.text
> > +	.align	4
> > +	.global	dt_d_execargs
> > +dt_d_execargs:
> > +	stxdw	[%fp+-8], %r1			/* save dctx to stack */
> > +	mov	%r9, %r3			/* %r9 = args */
> > +
> > +	mov	%r6, %r2			/* set %r6 in case of error */
> > +	jeq	%r6, 0, .Lerror
> > +
> > +	add	%r6, TASK_MM			/* ptr = &(T->mm) */
> > +
> > +	mov	%r1, %r9
> > +	mov	%r2, 8
> > +	mov	%r3, %r6
> > +	call	BPF_FUNC_probe_read
> > +	jne	%r0, 0, .Lerror
> > +
> > +	ldxdw	%r8, [%r9+0]			/* %r8 = T->mm */
> > +	jeq	%r8, 0, .Lempty
> > +	mov	%r6, %r8
> > +	add	%r6, TASK_MM_ARG_START		/* ptr = &(T->mm->arg_start) */
> > +
> > +	mov	%r1, %r9
> > +	mov	%r2, 8
> > +	mov	%r3, %r6
> > +	call	BPF_FUNC_probe_read
> > +	jne	%r0, 0, .Lerror
> > +
> > +	ldxdw	%r7, [%r9+0]			/* %r7 = T->mm->arg_start */
> > +	mov	%r6, %r8
> > +	add	%r6, TASK_MM_ARG_END		/* ptr = &(T->mm->arg_end) */
> > +
> > +	mov	%r1, %r9
> > +	mov	%r2, 8
> > +	mov	%r3, %r6
> > +	call	BPF_FUNC_probe_read
> > +	jne	%r0, 0, .Lerror
> > +
> > +	ldxdw	%r6, [%r9+0]			/* %r6 = T->mm->arg_end */
> > +
> > +	mov	%r8, %r6
> > +	sub	%r8, %r7			/* %r8 = len = arg_end - arg_start */
> > +	jslt	%r8, 2, .Lempty
> > +	mov	%r0, STRSZ
> > +	jslt	%r8, %r0, .Llen_ok
> > +	mov	%r8, %r0
> > +.Llen_ok:
> > +
> > +	/* read data from arg_start to arg_end */
> > +	mov	%r1, %r9
> > +	mov	%r2, %r8
> > +	mov	%r3, %r7
> > +	call	BPF_FUNC_probe_read		/* bpf_probe_read(&args, len + 1, arg_start) */
> > +	jne	%r0, 0, .Lerror
> > +
> > +	/* loop over args and replace '\0' with ' ' */
> > +	mov	%r1, %r8
> > +	sub	%r1, 2
> > +.Lloop:
> > +	mov	%r2, %r9
> > +	add	%r2, %r1
> > +	ldxb	%r0, [%r2+0]
> > +	jne	%r0, 0, .Lnot_nil
> > +	stb	[%r2+0], 32
> > +.Lnot_nil:
> > +	sub	%r1, 1
> > +	jsge	%r1, 0, .Lloop
> > +
> > +.Ldone:
> > +	mov	%r0, %r9
> > +	exit					/* return args */
> > +.Lerror:
> > +	ldxdw	%r1, [%fp+-8]
> > +	mov	%r2, PC
> > +	mov	%r3, DTRACEFLT_BADADDR
> > +	mov	%r4, %r6
> > +	call	dt_probe_error
> > +.Lempty:
> > +	mov	%r0, %r9
> > +	stb	[%r9+0], 0			/* args[0] = 0 */
> > +	exit					/* return args */
> > +	.size	dt_d_execargs, .-dt_d_execargs
> > diff --git a/dlibs/aarch64/5.11/procfs.d b/dlibs/aarch64/5.11/procfs.d
> > index 44ec4280..70a43ddf 100644
> > --- a/dlibs/aarch64/5.11/procfs.d
> > +++ b/dlibs/aarch64/5.11/procfs.d
> > @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
> >   				   : (struct tty_struct *)-1;
> >   	pr_fname = T->comm;
> > -/*
> > -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> > - */
> > +	pr_psargs = d_execargs(T);
> >   	pr_wstat = 0;
> >   /*
> >   	pr_argc = get_psinfo(T)->__psinfo(argc);
> > diff --git a/dlibs/aarch64/5.12/procfs.d b/dlibs/aarch64/5.12/procfs.d
> > index 44ec4280..70a43ddf 100644
> > --- a/dlibs/aarch64/5.12/procfs.d
> > +++ b/dlibs/aarch64/5.12/procfs.d
> > @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
> >   				   : (struct tty_struct *)-1;
> >   	pr_fname = T->comm;
> > -/*
> > -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> > - */
> > +	pr_psargs = d_execargs(T);
> >   	pr_wstat = 0;
> >   /*
> >   	pr_argc = get_psinfo(T)->__psinfo(argc);
> > diff --git a/dlibs/aarch64/5.14/procfs.d b/dlibs/aarch64/5.14/procfs.d
> > index 584ac325..ef27bb70 100644
> > --- a/dlibs/aarch64/5.14/procfs.d
> > +++ b/dlibs/aarch64/5.14/procfs.d
> > @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
> >   				   : (struct tty_struct *)-1;
> >   	pr_fname = T->comm;
> > -/*
> > -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> > - */
> > +	pr_psargs = d_execargs(T);
> >   	pr_wstat = 0;
> >   /*
> >   	pr_argc = get_psinfo(T)->__psinfo(argc);
> > diff --git a/dlibs/aarch64/5.16/procfs.d b/dlibs/aarch64/5.16/procfs.d
> > index 5aabc6f1..cad2d2c5 100644
> > --- a/dlibs/aarch64/5.16/procfs.d
> > +++ b/dlibs/aarch64/5.16/procfs.d
> > @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
> >   				   : (struct tty_struct *)-1;
> >   	pr_fname = T->comm;
> > -/*
> > -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> > - */
> > +	pr_psargs = d_execargs(T);
> >   	pr_wstat = 0;
> >   /*
> >   	pr_argc = get_psinfo(T)->__psinfo(argc);
> > diff --git a/dlibs/aarch64/5.2/procfs.d b/dlibs/aarch64/5.2/procfs.d
> > index 683ff5a8..6b1b1b9c 100644
> > --- a/dlibs/aarch64/5.2/procfs.d
> > +++ b/dlibs/aarch64/5.2/procfs.d
> > @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
> >   				   : (struct tty_struct *)-1;
> >   	pr_fname = T->comm;
> > -/*
> > -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> > - */
> > +	pr_psargs = d_execargs(T);
> >   	pr_wstat = 0;
> >   /*
> >   	pr_argc = get_psinfo(T)->__psinfo(argc);
> > diff --git a/dlibs/aarch64/5.6/procfs.d b/dlibs/aarch64/5.6/procfs.d
> > index 44ec4280..70a43ddf 100644
> > --- a/dlibs/aarch64/5.6/procfs.d
> > +++ b/dlibs/aarch64/5.6/procfs.d
> > @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
> >   				   : (struct tty_struct *)-1;
> >   	pr_fname = T->comm;
> > -/*
> > -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> > - */
> > +	pr_psargs = d_execargs(T);
> >   	pr_wstat = 0;
> >   /*
> >   	pr_argc = get_psinfo(T)->__psinfo(argc);
> > diff --git a/dlibs/aarch64/6.1/procfs.d b/dlibs/aarch64/6.1/procfs.d
> > index 5d7873b5..4cb7b77c 100644
> > --- a/dlibs/aarch64/6.1/procfs.d
> > +++ b/dlibs/aarch64/6.1/procfs.d
> > @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
> >   				   : (struct tty_struct *)-1;
> >   	pr_fname = T->comm;
> > -/*
> > -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> > - */
> > +	pr_psargs = d_execargs(T);
> >   	pr_wstat = 0;
> >   /*
> >   	pr_argc = get_psinfo(T)->__psinfo(argc);
> > diff --git a/dlibs/aarch64/6.10/procfs.d b/dlibs/aarch64/6.10/procfs.d
> > index 5d7873b5..4cb7b77c 100644
> > --- a/dlibs/aarch64/6.10/procfs.d
> > +++ b/dlibs/aarch64/6.10/procfs.d
> > @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
> >   				   : (struct tty_struct *)-1;
> >   	pr_fname = T->comm;
> > -/*
> > -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> > - */
> > +	pr_psargs = d_execargs(T);
> >   	pr_wstat = 0;
> >   /*
> >   	pr_argc = get_psinfo(T)->__psinfo(argc);
> > diff --git a/dlibs/x86_64/5.11/procfs.d b/dlibs/x86_64/5.11/procfs.d
> > index 7274554e..c2be76d8 100644
> > --- a/dlibs/x86_64/5.11/procfs.d
> > +++ b/dlibs/x86_64/5.11/procfs.d
> > @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
> >   				   : (struct tty_struct *)-1;
> >   	pr_fname = T->comm;
> > -/*
> > -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> > - */
> > +	pr_psargs = d_execargs(T);
> >   	pr_wstat = 0;
> >   /*
> >   	pr_argc = get_psinfo(T)->__psinfo(argc);
> > diff --git a/dlibs/x86_64/5.12/procfs.d b/dlibs/x86_64/5.12/procfs.d
> > index 7274554e..c2be76d8 100644
> > --- a/dlibs/x86_64/5.12/procfs.d
> > +++ b/dlibs/x86_64/5.12/procfs.d
> > @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
> >   				   : (struct tty_struct *)-1;
> >   	pr_fname = T->comm;
> > -/*
> > -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> > - */
> > +	pr_psargs = d_execargs(T);
> >   	pr_wstat = 0;
> >   /*
> >   	pr_argc = get_psinfo(T)->__psinfo(argc);
> > diff --git a/dlibs/x86_64/5.14/procfs.d b/dlibs/x86_64/5.14/procfs.d
> > index d1cf90d3..28fada6d 100644
> > --- a/dlibs/x86_64/5.14/procfs.d
> > +++ b/dlibs/x86_64/5.14/procfs.d
> > @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
> >   				   : (struct tty_struct *)-1;
> >   	pr_fname = T->comm;
> > -/*
> > -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> > - */
> > +	pr_psargs = d_execargs(T);
> >   	pr_wstat = 0;
> >   /*
> >   	pr_argc = get_psinfo(T)->__psinfo(argc);
> > diff --git a/dlibs/x86_64/5.16/procfs.d b/dlibs/x86_64/5.16/procfs.d
> > index 5aabc6f1..cad2d2c5 100644
> > --- a/dlibs/x86_64/5.16/procfs.d
> > +++ b/dlibs/x86_64/5.16/procfs.d
> > @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
> >   				   : (struct tty_struct *)-1;
> >   	pr_fname = T->comm;
> > -/*
> > -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> > - */
> > +	pr_psargs = d_execargs(T);
> >   	pr_wstat = 0;
> >   /*
> >   	pr_argc = get_psinfo(T)->__psinfo(argc);
> > diff --git a/dlibs/x86_64/5.2/procfs.d b/dlibs/x86_64/5.2/procfs.d
> > index 35538862..08696cf7 100644
> > --- a/dlibs/x86_64/5.2/procfs.d
> > +++ b/dlibs/x86_64/5.2/procfs.d
> > @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
> >   				   : (struct tty_struct *)-1;
> >   	pr_fname = T->comm;
> > -/*
> > -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> > - */
> > +	pr_psargs = d_execargs(T);
> >   	pr_wstat = 0;
> >   /*
> >   	pr_argc = get_psinfo(T)->__psinfo(argc);
> > diff --git a/dlibs/x86_64/5.6/procfs.d b/dlibs/x86_64/5.6/procfs.d
> > index 7274554e..c2be76d8 100644
> > --- a/dlibs/x86_64/5.6/procfs.d
> > +++ b/dlibs/x86_64/5.6/procfs.d
> > @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
> >   				   : (struct tty_struct *)-1;
> >   	pr_fname = T->comm;
> > -/*
> > -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> > - */
> > +	pr_psargs = d_execargs(T);
> >   	pr_wstat = 0;
> >   /*
> >   	pr_argc = get_psinfo(T)->__psinfo(argc);
> > diff --git a/dlibs/x86_64/6.1/procfs.d b/dlibs/x86_64/6.1/procfs.d
> > index 5d7873b5..4cb7b77c 100644
> > --- a/dlibs/x86_64/6.1/procfs.d
> > +++ b/dlibs/x86_64/6.1/procfs.d
> > @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
> >   				   : (struct tty_struct *)-1;
> >   	pr_fname = T->comm;
> > -/*
> > -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> > - */
> > +	pr_psargs = d_execargs(T);
> >   	pr_wstat = 0;
> >   /*
> >   	pr_argc = get_psinfo(T)->__psinfo(argc);
> > diff --git a/dlibs/x86_64/6.10/procfs.d b/dlibs/x86_64/6.10/procfs.d
> > index 5d7873b5..4cb7b77c 100644
> > --- a/dlibs/x86_64/6.10/procfs.d
> > +++ b/dlibs/x86_64/6.10/procfs.d
> > @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
> >   				   : (struct tty_struct *)-1;
> >   	pr_fname = T->comm;
> > -/*
> > -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> > - */
> > +	pr_psargs = d_execargs(T);
> >   	pr_wstat = 0;
> >   /*
> >   	pr_argc = get_psinfo(T)->__psinfo(argc);
> > diff --git a/include/dtrace/dif_defines.h b/include/dtrace/dif_defines.h
> > index c8c1d961..cd785723 100644
> > --- a/include/dtrace/dif_defines.h
> > +++ b/include/dtrace/dif_defines.h
> > @@ -207,10 +207,11 @@
> >   #define DIF_SUBR_INET_NTOP		41
> >   #define DIF_SUBR_INET_NTOA		42
> >   #define DIF_SUBR_INET_NTOA6		43
> > -#define DIF_SUBR_D_PATH			44
> > -#define DIF_SUBR_LINK_NTOP		45
> > +#define DIF_SUBR_LINK_NTOP		44
> > +#define DIF_SUBR_D_PATH			45
> > +#define DIF_SUBR_D_EXECARGS		46
> > -#define DIF_SUBR_MAX			45
> > +#define DIF_SUBR_MAX			46
> >   typedef uint32_t	dif_instr_t;
> > diff --git a/libdtrace/dt_bpf.h b/libdtrace/dt_bpf.h
> > index 6518de66..85934d2d 100644
> > --- a/libdtrace/dt_bpf.h
> > +++ b/libdtrace/dt_bpf.h
> > @@ -47,15 +47,18 @@ extern "C" {
> >   #define DT_CONST_TASK_TGID		12
> >   #define DT_CONST_TASK_REAL_PARENT	13
> >   #define DT_CONST_TASK_COMM		14
> > -#define DT_CONST_MUTEX_OWNER		15
> > -#define DT_CONST_RWLOCK_CNTS		16
> > -#define DT_CONST_DCTX_RODATA		17
> > -#define DT_CONST_RODATA_OFF		18
> > -#define DT_CONST_RODATA_SIZE		19
> > -#define DT_CONST_ZERO_OFF		20
> > -#define DT_CONST_STACK_OFF		21
> > -#define DT_CONST_STACK_SKIP		22
> > -#define DT_CONST_NPROBES		23
> > +#define DT_CONST_TASK_MM		15
> > +#define DT_CONST_TASK_MM_ARG_START	16
> > +#define DT_CONST_TASK_MM_ARG_END	17
> > +#define DT_CONST_MUTEX_OWNER		18
> > +#define DT_CONST_RWLOCK_CNTS		19
> > +#define DT_CONST_DCTX_RODATA		20
> > +#define DT_CONST_RODATA_OFF		21
> > +#define DT_CONST_RODATA_SIZE		22
> > +#define DT_CONST_ZERO_OFF		23
> > +#define DT_CONST_STACK_OFF		24
> > +#define DT_CONST_STACK_SKIP		25
> > +#define DT_CONST_NPROBES		26
> >   #define DT_BPF_LOG_SIZE_DEFAULT	(UINT32_MAX >> 8)
> >   #define DT_BPF_LOG_SIZE_SMALL	4096
> > diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
> > index 29cfbd84..1dc119ea 100644
> > --- a/libdtrace/dt_cc.c
> > +++ b/libdtrace/dt_cc.c
> > @@ -1082,7 +1082,8 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
> >   			case DT_CONST_TASK_PID:
> >   			case DT_CONST_TASK_TGID:
> >   			case DT_CONST_TASK_REAL_PARENT:
> > -			case DT_CONST_TASK_COMM: {
> > +			case DT_CONST_TASK_COMM:
> > +			case DT_CONST_TASK_MM: {
> >   				ctf_file_t *cfp = dtp->dt_shared_ctf;
> >   				ctf_id_t type;
> >   				ctf_membinfo_t ctm;
> > @@ -1108,6 +1109,36 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
> >   				case DT_CONST_TASK_COMM:
> >   					rc = ctf_member_info(cfp, type, "comm", &ctm);
> >   					break;
> > +				case DT_CONST_TASK_MM:
> > +					rc = ctf_member_info(cfp, type, "mm", &ctm);
> > +					break;
> > +				}
> > +				if (rc == CTF_ERR)
> > +					goto err_ctf;
> > +				nrp->dofr_data = ctm.ctm_offset / NBBY;
> > +				continue;
> > +			}
> > +			case DT_CONST_TASK_MM_ARG_START:
> > +			case DT_CONST_TASK_MM_ARG_END: {
> > +				ctf_file_t *cfp = dtp->dt_shared_ctf;
> > +				ctf_id_t type;
> > +				ctf_membinfo_t ctm;
> > +				int rc = 0;
> > +
> > +				if (!cfp)
> > +					return dt_set_errno(dtp, EDT_NOCTF);
> > +
> > +				type = ctf_lookup_by_name(cfp, "struct mm_struct");
> > +				if (type == CTF_ERR)
> > +					goto err_ctf;
> > +
> > +				switch (idp->di_id) {
> > +				case DT_CONST_TASK_MM_ARG_START:
> > +					rc = ctf_member_info(cfp, type, "arg_start", &ctm);
> > +					break;
> > +				case DT_CONST_TASK_MM_ARG_END:
> > +					rc = ctf_member_info(cfp, type, "arg_end", &ctm);
> > +					break;
> >   				}
> >   				if (rc == CTF_ERR)
> >   					goto err_ctf;
> > diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> > index 6e74b4b0..a1a39f3f 100644
> > --- a/libdtrace/dt_cg.c
> > +++ b/libdtrace/dt_cg.c
> > @@ -3300,7 +3300,6 @@ dt_cg_load_var(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
> >   	}
> >   	/* built-in variables (note: args[] is handled in dt_cg_array_op) */
> > -	/* Special case for arg0 through arg9; encode as args[n] */
> >   	if (idp->di_id >= DIF_VAR_ARG0 && idp->di_id <= DIF_VAR_ARG9) {
> >   		fnp = dt_dlib_get_func(yypcb->pcb_hdl, "dt_bvar_args");
> >   		idx = idp->di_id - DIF_VAR_ARG0;
> > @@ -6661,6 +6660,13 @@ dt_cg_subr_inet_ntop(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
> >   	tnp->dn_tstring = NULL;
> >   }
> > +static void
> > +dt_cg_subr_d_execargs(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
> > +{
> > +	dt_cg_subr_arg_to_tstring(dnp, dlp, drp, "dt_d_execargs", 0,
> > +				  DT_IGNOR, 0, DT_IGNOR, 0);
> > +}
> > +
> >   static void
> >   dt_cg_subr_d_path(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
> >   {
> > @@ -6758,6 +6764,7 @@ static dt_cg_subr_f *_dt_cg_subr[DIF_SUBR_MAX + 1] = {
> >   	[DIF_SUBR_INET_NTOP]		= &dt_cg_subr_inet_ntop,
> >   	[DIF_SUBR_INET_NTOA]		= &dt_cg_subr_inet_ntoa,
> >   	[DIF_SUBR_INET_NTOA6]		= &dt_cg_subr_inet_ntoa6,
> > +	[DIF_SUBR_D_EXECARGS]		= &dt_cg_subr_d_execargs,
> >   	[DIF_SUBR_D_PATH]		= &dt_cg_subr_d_path,
> >   	[DIF_SUBR_LINK_NTOP]		= &dt_cg_subr_link_ntop,
> >   };
> > diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
> > index 07d22afd..9ad4f5e7 100644
> > --- a/libdtrace/dt_dlibs.c
> > +++ b/libdtrace/dt_dlibs.c
> > @@ -89,6 +89,9 @@ static const dt_ident_t		dt_bpf_symbols[] = {
> >   	DT_BPF_SYMBOL_ID(TASK_TGID, DT_IDENT_SCALAR, DT_CONST_TASK_TGID),
> >   	DT_BPF_SYMBOL_ID(TASK_REAL_PARENT, DT_IDENT_SCALAR, DT_CONST_TASK_REAL_PARENT),
> >   	DT_BPF_SYMBOL_ID(TASK_COMM, DT_IDENT_SCALAR, DT_CONST_TASK_COMM),
> > +	DT_BPF_SYMBOL_ID(TASK_MM, DT_IDENT_SCALAR, DT_CONST_TASK_MM),
> > +	DT_BPF_SYMBOL_ID(TASK_MM_ARG_START, DT_IDENT_SCALAR, DT_CONST_TASK_MM_ARG_START),
> > +	DT_BPF_SYMBOL_ID(TASK_MM_ARG_END, DT_IDENT_SCALAR, DT_CONST_TASK_MM_ARG_END),
> >   	DT_BPF_SYMBOL_ID(MUTEX_OWNER, DT_IDENT_SCALAR, DT_CONST_MUTEX_OWNER),
> >   	DT_BPF_SYMBOL_ID(RWLOCK_CNTS, DT_IDENT_SCALAR, DT_CONST_RWLOCK_CNTS),
> >   	DT_BPF_SYMBOL_ID(DCTX_RODATA, DT_IDENT_SCALAR, DT_CONST_DCTX_RODATA),
> > diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> > index a0205887..c8208de6 100644
> > --- a/libdtrace/dt_open.c
> > +++ b/libdtrace/dt_open.c
> > @@ -138,6 +138,8 @@ static const dt_ident_t _dtrace_globals[] = {
> >   	{ DTRACE_STABILITY_STABLE, DTRACE_STABILITY_PRIVATE,
> >   	DTRACE_CLASS_COMMON }, DT_VERS_1_0,
> >   	&dt_idops_type, "vmlinux`struct task_struct *" },
> > +{ "d_execargs", DT_IDENT_FUNC, 0, DIF_SUBR_D_EXECARGS, DT_ATTR_EVOLCMN,
> > +	DT_VERS_2_0, &dt_idops_func, "string(vmlinux`struct task_struct *)" },
> >   { "d_path", DT_IDENT_FUNC, DT_IDFLG_DPTR, DIF_SUBR_D_PATH, DT_ATTR_EVOLCMN,
> >   	DT_VERS_1_0, &dt_idops_func, "string(struct path *)" },
> >   { "ddi_pathname", DT_IDENT_FUNC, 0, DIF_SUBR_DDI_PATHNAME,
> > diff --git a/libdtrace/procfs.d.in b/libdtrace/procfs.d.in
> > index 038cf69b..e9d50349 100644
> > --- a/libdtrace/procfs.d.in
> > +++ b/libdtrace/procfs.d.in
> > @@ -179,9 +179,7 @@ translator psinfo_t < struct task_struct *T > {
> >   				   : (struct tty_struct *)-1;
> >   	pr_fname = T->comm;
> > -/*
> > -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> > - */
> > +	pr_psargs = d_execargs(T);
> >   	pr_wstat = 0;
> >   /*
> >   	pr_argc = get_psinfo(T)->__psinfo(argc);
> > diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.d b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.d
> > new file mode 100644
> > index 00000000..c707184d
> > --- /dev/null
> > +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.d
> > @@ -0,0 +1,16 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: The argument to d_execargs() should be a (struct task_struct *).
> > + */
> > +
> > +BEGIN
> > +{
> > +	trace(d_execargs(1));
> > +	exit(0);
> > +}
> > diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.r b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.r
> > new file mode 100644
> > index 00000000..0e9cda07
> > --- /dev/null
> > +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.r
> > @@ -0,0 +1,4 @@
> > +-- @@stderr --
> > +dtrace: failed to compile script test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.d: [D_PROTO_ARG] line 14: d_execargs( ) argument #1 is incompatible with prototype:
> > +	prototype: struct task_struct *
> > +	 argument: int
> > diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.d b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.d
> > new file mode 100644
> > index 00000000..ba419689
> > --- /dev/null
> > +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.d
> > @@ -0,0 +1,16 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: The argument to d_execargs() should be (struct task_struct *).
> > + */
> > +
> > +BEGIN
> > +{
> > +	trace(d_execargs("a"));
> > +	exit(0);
> > +}
> > diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.r b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.r
> > new file mode 100644
> > index 00000000..ac1c1401
> > --- /dev/null
> > +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.r
> > @@ -0,0 +1,4 @@
> > +-- @@stderr --
> > +dtrace: failed to compile script test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.d: [D_PROTO_ARG] line 14: d_execargs( ) argument #1 is incompatible with prototype:
> > +	prototype: struct task_struct *
> > +	 argument: string
> > diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.d b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.d
> > new file mode 100644
> > index 00000000..473e35e4
> > --- /dev/null
> > +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.d
> > @@ -0,0 +1,16 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: The argument to d_execargs() should be (struct task_struct *).
> > + */
> > +
> > +BEGIN
> > +{
> > +	trace(d_execargs(curthread->mm));
> > +	exit(0);
> > +}
> > diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.r b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.r
> > new file mode 100644
> > index 00000000..842371a3
> > --- /dev/null
> > +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.r
> > @@ -0,0 +1,4 @@
> > +-- @@stderr --
> > +dtrace: failed to compile script test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.d: [D_PROTO_ARG] line 14: d_execargs( ) argument #1 is incompatible with prototype:
> > +	prototype: struct task_struct *
> > +	 argument: struct mm_struct *
> > diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.d b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.d
> > new file mode 100644
> > index 00000000..86b1b237
> > --- /dev/null
> > +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.d
> > @@ -0,0 +1,16 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: d_execargs() requires an argument
> > + */
> > +
> > +BEGIN
> > +{
> > +	trace(d_execargs());
> > +	exit(0);
> > +}
> > diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.r b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.r
> > new file mode 100644
> > index 00000000..a4fcd162
> > --- /dev/null
> > +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.r
> > @@ -0,0 +1,2 @@
> > +-- @@stderr --
> > +dtrace: failed to compile script test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.d: [D_PROTO_LEN] line 14: d_execargs( ) prototype mismatch: 0 args passed, 1 expected
> > diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.d b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.d
> > new file mode 100644
> > index 00000000..3add63f6
> > --- /dev/null
> > +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.d
> > @@ -0,0 +1,16 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: The d_execargs() subroutine accepts no more than one argument.
> > + */
> > +
> > +BEGIN
> > +{
> > +	trace(d_execargs(curthread, 1));
> > +	exit(0);
> > +}
> > diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.r b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.r
> > new file mode 100644
> > index 00000000..f5a982ff
> > --- /dev/null
> > +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.r
> > @@ -0,0 +1,2 @@
> > +-- @@stderr --
> > +dtrace: failed to compile script test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.d: [D_PROTO_LEN] line 14: d_execargs( ) prototype mismatch: 2 args passed, 1 expected
> > diff --git a/test/unittest/funcs/d_execargs/tst.d_execargs.d b/test/unittest/funcs/d_execargs/tst.d_execargs.d
> > new file mode 100644
> > index 00000000..b8b141aa
> > --- /dev/null
> > +++ b/test/unittest/funcs/d_execargs/tst.d_execargs.d
> > @@ -0,0 +1,31 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: d_execargs() provides correct results.
> > + */
> > +
> > +#pragma D option destructive
> > +#pragma D option quiet
> > +
> > +BEGIN
> > +{
> > +	mypid = pid;
> > +	system("/bin/echo TEST");
> > +}
> > +
> > +proc:::exec-success
> > +/progenyof(mypid) && d_execargs(curthread) == "/bin/echo TEST"/
> > +{
> > +	trace(d_execargs(curthread));
> > +	exit(0);
> > +}
> > +
> > +tick-1s
> > +{
> > +	exit(1);
> > +}
> > diff --git a/test/unittest/funcs/d_execargs/tst.d_execargs.r b/test/unittest/funcs/d_execargs/tst.d_execargs.r
> > new file mode 100644
> > index 00000000..d8ff6689
> > --- /dev/null
> > +++ b/test/unittest/funcs/d_execargs/tst.d_execargs.r
> > @@ -0,0 +1,2 @@
> > +TEST
> > +/bin/echo TEST
> > diff --git a/test/unittest/proc/tst.pr_psargs.d b/test/unittest/proc/tst.pr_psargs.d
> > new file mode 100644
> > index 00000000..902ac1a3
> > --- /dev/null
> > +++ b/test/unittest/proc/tst.pr_psargs.d
> > @@ -0,0 +1,31 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: psinfo->pr_psargs provides correct results.
> > + */
> > +
> > +#pragma D option destructive
> > +#pragma D option quiet
> > +
> > +BEGIN
> > +{
> > +	mypid = pid;
> > +	system("/bin/echo TEST");
> > +}
> > +
> > +proc:::exec-success
> > +/progenyof(mypid) && curpsinfo->pr_psargs == "/bin/echo TEST"/
> > +{
> > +	trace(curpsinfo->pr_psargs);
> > +	exit(0);
> > +}
> > +
> > +tick-1s
> > +{
> > +	exit(1);
> > +}
> > diff --git a/test/unittest/proc/tst.pr_psargs.r b/test/unittest/proc/tst.pr_psargs.r
> > new file mode 100644
> > index 00000000..397c8717
> > --- /dev/null
> > +++ b/test/unittest/proc/tst.pr_psargs.r
> > @@ -0,0 +1,9 @@
> > +TEST
> > +
> > +             0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f  0123456789abcdef
> > +         0: 2f 62 69 6e 2f 65 63 68 6f 20 54 45 53 54 00 00  /bin/echo TEST..
> > +        10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> > +        20: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> > +        30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> > +        40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> > +
