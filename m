Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B552BCF5
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 16:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750350033; cv=fail; b=kltO+icUr9ph9/m/8TUzxIigU0kIQDlgGLzMLZ6DTm1ct3AtyVJ47gTokJPFZPOMOCBLGHV98khP2tD1ZNwqiLe2i0a1EcFJdwOycAIJ1QtktuUXJVCzm7xdLkHKiUqSeEKUjKx7wy/bm/qnn2q3Tw+oyoJgTTBX9HEVPBAzgfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750350033; c=relaxed/simple;
	bh=eDJcf2Ycpes/Yf6GbaJKwFkqam6dmKlnwD8yhashPZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CrC+uN7d2fTcYKar5zww2K7kCY9FzI6AtIzuxhrFA3uGjmjn2RoYcleyzSmXkIweDfWMcKP50igxYA8sIrN9YtZGVhofp2AZir5PcPPud6ZeQrufiedb7jjKSa5y6MgpkrgEmW0F5kPlLEbSTkTkcm+Tx43fyENZD3BtQrAaEHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=alwdC6g8; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mG9xVwm0 reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="alwdC6g8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mG9xVwm0"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JEMbPJ014966
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 16:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=yyICKihy5VZbIACQNCc32mhB6FaJ8JOj+KwOvkqiobo=; b=
	alwdC6g8hWOZ0lOc37h82+15Szzl79KTmGWLvzyIFhU7EJnBeZe/l7T67szQIHbw
	4UdZZORvE+wR4yQIq/aBeDm598Laxmx4bcBjLbq7kSlZvGdBXCOmmJ+dX0hPgZje
	nNTo+X7zZ9zKaKROdP9AbSdJtSqYttkbeT7ZymvsPAaApZlNkkywEO+bGec6uaW0
	fxhs8p8wtTpP4dCtfihPfI7420Mt1/VP6ajgPVQSzNJkVSny3fNJ9lcWZE3pKYkY
	LsIpQhbcy0OfG8AikGDbQAAy+RhfZ/jPlXx/gMM6HBfgIQLYKsHxXaY7ZZaMNMWD
	wWtRoAukGMIO3A2kDFXLHA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yp4t8k1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 16:20:30 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JFSBZA009782
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 16:20:28 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010062.outbound.protection.outlook.com [52.101.85.62])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhjjj7y-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 16:20:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WqGNrQpe0EaAgNhStlaR5RgChQElk9ojcSwQHNs77m34f1iN2aV+5aqP34Z3fnJC1uv4hZSfa7c2NGemAJ3YwfXA4fM3krsGU5TSgRkl3JJlSwCqj9EaDOcLYJtw1kldD70dUoCH169GQakTWEdC/Zo+JJL/GEA4g0l1/4be8QUNTb/FdCYCeUwbFNa16B+mVunrYFYMI9iWCAMZ8gdjtZG1p3Cm7bZqKvwD60QocYAA/JQSyaaa7+Q+sEtB8yJ2oRTmA7/X6GKjLhetRL2005ql0rh1Vck1HG5W02nzZpton1a2dVN0aLsoU3MNyZiPymADhqXnxXq7PH2Pu52luA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=37hVkdXj46ACGDuvw8zfi0Kq9Ab7aJAmhpVZ5Rej9AQ=;
 b=vOuxySapLYb/oHSAmhGciKt+utR8i3jxgOBUT+pX5BbF0bX69hPnR+2IloMb4Ew28FEG56GilSfeY85uW0W4OP2YcWQ2CW2VOnZtUSBxsQe1Ssy/hS/v/kb9BbLyXcMmYsENrqV6Pr8Y+4yFuufIXnQbgSHr7cmIbShyLa3IoxDSmYNjvdc+DPwxbd/E/yBUpxqdneGy1TjefvlDLu0f721pcj6PkE8kNp9g8b4EVP+hjWISzmaQO+juzoBg5XpogPfs51GqfveoKL9aLSGamQqg63ROZmNa1HY5goGHbgyFrWZ3/QE+W68FTEosogBF/TBQlG+Ld3VZieIzxrY7PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37hVkdXj46ACGDuvw8zfi0Kq9Ab7aJAmhpVZ5Rej9AQ=;
 b=mG9xVwm0rrmmirbBBt/NuwhiGwZCYt7HF7IzB09xLN9nEVK1t5HJkuBNFCdn5QIpZUBTZSEDqWPBGoMe5QbUZm9LmNuMgT4eSUwZ/HU6XnBmuVkLOr1jvmtTBQUpZ3GrQZWGhTxqm4CTD1oW0YhPdBAtSeh1op3EPFJxiRZZYLg=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DM3PPF334FD9217.namprd10.prod.outlook.com (2603:10b6:f:fc00::c19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 16:20:25 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 16:20:25 +0000
Date: Thu, 19 Jun 2025 12:20:22 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 01/14] Fix stack-skip counts for caller and stackdepth
Message-ID: <aFQ4xujz8hJRUGjB@oracle.com>
References: <20250522180118.27343-1-eugene.loh@oracle.com>
 <87sek3d83m.fsf@esperi.org.uk>
 <6cdb7118-e678-57e7-adff-a74a1ff39e19@oracle.com>
 <87jz57zxvn.fsf@esperi.org.uk>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87jz57zxvn.fsf@esperi.org.uk>
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
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DM3PPF334FD9217:EE_
X-MS-Office365-Filtering-Correlation-Id: e3b3127e-bc74-46c1-3e87-08ddaf4d3295
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?VUcynSv01Om4lMJfv+Yi7I+Nt/D84GOjshEGjLWR9gvIXmQAHgL49k/3Ww?=
 =?iso-8859-1?Q?1LtjT4zry8rj49kr+JGGexvY5FyKndE0D5W8Un3AdW7ruWKWF4qmq6F56n?=
 =?iso-8859-1?Q?VHcAckL9RAtKog5izpbGmRSGUQpQLG+ch+BckTvoRVCQb0swgZpxRasUU5?=
 =?iso-8859-1?Q?WA7NQmA0QMYq5rxNK2h7fCM+gtIshJXiytnqywUBUSnGDoGvac9eWjAUPp?=
 =?iso-8859-1?Q?EEdQdb+La7cARVBTockZWtOIF6o8iOjnpOffn/WKv0ETCFuY8YKC/skzJ+?=
 =?iso-8859-1?Q?qhPksOvrm2dd2AbCI62oUhO1JfhpyNrU52aRzJsBQ7JOrHe6q686pXdrtz?=
 =?iso-8859-1?Q?oOPE5uKc0fajicuawhhDnygwss2Fg7MSHp3VfD1JD5atHgi2ME7eJR3Vle?=
 =?iso-8859-1?Q?0uHlKr9hJK7H53TVXPIKWf/btPGCjHuKGoHvpu3wdgQrjzj3yPe1ng42zg?=
 =?iso-8859-1?Q?W1GM71qWlBBDSscf9AUpNIgyRGeNpMpmfBxY1hIyxQK159vSCK4a8VPdsv?=
 =?iso-8859-1?Q?aqCa5RsHREFHcJaVIY1xw6dQ0KZNIIbeYCh2O4fg7eSdJJ8JOyKdsZo9Wv?=
 =?iso-8859-1?Q?kRVMRp16gWueo54y31wz3A69WfZaf7CUYCSyEtKhzQIcQm09+QBIOxk7gq?=
 =?iso-8859-1?Q?PCCleyS1arxacbHI02CHYCZwuKN5nGn7rKfLxNauplmyjfaZlcbOC5384m?=
 =?iso-8859-1?Q?G+agKmR+v49iJ2MMSdV2VttjSHpBZcYnsydop/Zu9UXOwBJaLR252uVnDZ?=
 =?iso-8859-1?Q?7yW5dRey0Ebo9pErA6SttmKVuFYHi0gz0a4mqe7pp55VMBhzDB7N5cNpQw?=
 =?iso-8859-1?Q?gpKS4gSgVwTykMJzt4Sq5FoBmA7z6frE+uWTNVIAEKyPfNc0qBMvsgNgYi?=
 =?iso-8859-1?Q?W1v9tft9KbJpY1g0zK10vGTFJngAt06cJxb2VN7VZq87UtIiTBqrs3afIo?=
 =?iso-8859-1?Q?M5/W+njOQNpPD/97LsposCxcq+K3Eq+k33l0SQErR7CF+z58HUYApclgYS?=
 =?iso-8859-1?Q?p29GgmmJDpmpYrZQ1CF2pJkomjAtxnaM1wJMfFTPqQHWNu9kX+Uff3r7KE?=
 =?iso-8859-1?Q?RnZMlxrB88p7HR8iaSNxH8hezITqYH7XXKk8bic9IRoC1t4TC2orQ6lBt0?=
 =?iso-8859-1?Q?/RnDEG6Bw/Ga/N/SZitmjz2OAgueOuMxiGMjcdBSe0UJ9fdDumcB9Uk5IE?=
 =?iso-8859-1?Q?Tv9NBXs36j4Clrq7152hygZvW66Pa9xsmkfQAV38OX/7Wi/q0n/wdOx+7m?=
 =?iso-8859-1?Q?peZquDatESDOzyZ3t7XDKDAbAgSoMCj2IKcwjjuNXjUfUhYMPBi6vwR19s?=
 =?iso-8859-1?Q?n0vmt+HzovzSqMxfMOdZubDVb1FV5U5iLcPLW4Z4XKoXnA4TiG8FYG4Psh?=
 =?iso-8859-1?Q?xF22fV7cM0sDmvqUbVlztiVo3RdtRj0xJV6AKTdvUwF34IbLWypSnbbQFZ?=
 =?iso-8859-1?Q?hO8dVXpxQBL1GUBAoRcMPoqLv5RHPDF1Q3PEagaAscDL0D9JnavYH8QB39?=
 =?iso-8859-1?Q?k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?nuwmMeDCLWdq7aYRTE1Bm4bTJQVaOLfh9kSWcfp9bUpMQDBIQsAvJlxri+?=
 =?iso-8859-1?Q?LsmI5hvmtrC39ckKKU5CgSsgjE5WqyfYUb5RVe8Uc5yDxWw+VJWDdByLXh?=
 =?iso-8859-1?Q?t5VdvYRSUpnJS5m56rjm9LXA0dcx16hMJqaII4+OPb3mgsI202SASf6KBC?=
 =?iso-8859-1?Q?hLqQ9Tnn9B8cxLrr/ulZG9M3C4GUlY9OsZ7Y8xCBek638wMhcKzofZlkFN?=
 =?iso-8859-1?Q?/I40KVfnhhHutqBS73uh+2D5+35Rw02Hvb6Mv1Uih7ol3iCoQzU5bm+OOF?=
 =?iso-8859-1?Q?0K5vIAjCl5MTp+KEX/wvGQlryfLi6l3ygiLkIigMTsdynSEJbMkbJLTmlt?=
 =?iso-8859-1?Q?ILOn/XWbDGcW/KkQkrge+dodRubQeIiq7ZFArzmUmWUTiEta0C7YWImrfB?=
 =?iso-8859-1?Q?3IuRBcr6Jw/W7hbvXb1W8BiKb4OU1KQmi2N/icdnGyywKeZUR8hUElb82e?=
 =?iso-8859-1?Q?L1Kxsb3NcFivP5JDnmwF41WNJYH1pwLmXHAiS0i5kM99ybw+crhtWw7OUT?=
 =?iso-8859-1?Q?C4AIERqzlWY/ktXprAFP9vl/ad/Am3Rp+4M0HutTbNteyqmILDI+vth9Yu?=
 =?iso-8859-1?Q?3Oa/4NjP0MSULki/nbwIVF7NvE0Uzq0vHg+/G3ShGzEF392GqwkpW1WTA7?=
 =?iso-8859-1?Q?uRMSqOuzlwwwdSIYfmjaYO5KeDrbGo6jk/cErzp1D//QgsG3Ad96PAAacm?=
 =?iso-8859-1?Q?lio66Pcndtn39NXhxw4VACUpamAIdjBnwh7Pmfn9zaiAzAMwtM/vlVEUhR?=
 =?iso-8859-1?Q?0l8tL3iwohwJ4d8T81ILRySQUqHrTIq2z40kBm7ag2GzLqvvvtavNNywTd?=
 =?iso-8859-1?Q?IOQAXXdvRkvNpeMezl8fcOLneL6hzPNP67Mqmkm5mgBXLKCwNGGCjHRB6b?=
 =?iso-8859-1?Q?8I2VtK/PjuMQTUQWdMfT4+iMsVZwLJ5b/CCqDNT6UQ/ZT23X3qcirGJ1Sz?=
 =?iso-8859-1?Q?Ps401Wiu76pjZQPDgAX5Ug7fofzU8aot5Qf5Dy0Hr5Nxr51hclZosc0nQc?=
 =?iso-8859-1?Q?Hy61LlsHvr1hq0SyONIReigv+YNcsqoNW+sLneYcAnhyYdJ1T6T2OEJNoD?=
 =?iso-8859-1?Q?pt6/1wZMxWuSitED48im4a+VN+saxnePH8R2BSIc2fWF3bljR9e0A+mmlL?=
 =?iso-8859-1?Q?+8ZRVPDPWBhOjfDvqvPoA54glw+N3Fzfjfpgl8wkzb9RzH9BYfOp14tGSS?=
 =?iso-8859-1?Q?qn+QkHGMahzIAi66uk2sV1PrPfWgLViceibeDu3uhpdsgHG7/5JIQ0CGDk?=
 =?iso-8859-1?Q?QAPgzpkjeKiRVAl4xvXi4LTLTHsgfaBTMSSQ63bLrXr3AfYqqSOnr7JVwb?=
 =?iso-8859-1?Q?HQSULmIbgYSZlitHpBFwetDkT3sW1e7yojnlzOe42+0q/Fq1k4W9rDkcM/?=
 =?iso-8859-1?Q?3rSnvaezv2OeZPb+cMHOiKiZSRmKKmszNKKZe2xpZjBi6Gj9M67LBh5aVZ?=
 =?iso-8859-1?Q?9wz3oUwg6C8ylx45CUvz8A1SPVPvjAakxY9+H4Lh97pAGRexgeKP4IkvWJ?=
 =?iso-8859-1?Q?k+1DTDz15ENzX0ZSPNofrxBu3SlpUdM1PfiVcrwwMn9EkWcJ2LJOukyQNF?=
 =?iso-8859-1?Q?r7EOiESKT0o9p6dICunZzsbGbpSjXm/NaWiGlsLq1bBT0U//VC3KsITIKt?=
 =?iso-8859-1?Q?SyvT5oY5YMxfI/cQkIDVh6/WbafmmSCBOLjixzfJxPmtHUiAYbT5brbw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8JzaLeOYBtamsd4hpGy4iTCxZYub8nBQBwu1jMP6YNC01JZ/m18F6zX/A/4xcb74DsF17c6ouwljZwr2MkgQRcdP3lLMDeVa/Iky2U0hjc9Tl3WwLTGHkX/dm6mSpbJ8+LEzMU5agDXLeoQCSpp4Frq+JPZ5NOCgS+2MwEwmllGQm6aKeg4SMJ+qY85lbtxe/gbAc2I2T3xt3c8CpgJGT4KfIjoHAgiysmN/d2x++1NaqXC/DA3H62q1nRkPIVUX5gL4LXUH4r5XTdh9+76pOzVpFqFXZJwGvco+zu86mjAyTKkskEGf00fntldhsRxPBeBH7Oit5WsL3BM4Yer1+mZlKccufRcoEK8dH8rHt8Ksuc7lAG7bubapBW+MwijhiyhNfy5rYqGJQU0Nh7MTY86v+WiE9x+bHouJ8E3oF27dZzk6UzRGbldGPgf4bED/db2gP0IujjptaZNzhz7vyIon0UQFjEAPr73hFYaSSmmomX3liVnxDx7MAIq98By1c7aq4RbKdi0AvMY5LT5yF6qxGfzN+BIat5d2usk6dhLSseQhjNNNSYeYnizo3etFpJyUzrHzPzWobLxSN/8gIBzm5KRPU2t5wUye0nl72Tw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3b3127e-bc74-46c1-3e87-08ddaf4d3295
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 16:20:25.3922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tRUjA0IpvdYk3uVC8kyedGbQEyBo4PQK6FmGLgRFpR8B2Gk3w871jsrh241K69WYtcE7KzYeTrp+q+/uMt8WdhqcJ5K2x4/+D680rhfSwy4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF334FD9217
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_06,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506190134
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEzNSBTYWx0ZWRfXypcqzFPIbcGm FhD8xlyVYH5HipU+DsHuqu7wlDoB1YjZSBhp3lI5pErxuwLsqVUVVHyaj99IPw4VXGhljyfp3EP gaidVlea2e2h0qa3X6hsknndnjOSMo1GDxuYE69q9Zw/f1/JNvfEv2IGEqrYl52oEZ7k4eWD2Ns
 slwaFPM2IYiUWr6Rr07p8ZkgXJbQNdNVyhjQsOvZTzxStyMWVYcVRKRWkb5wVNwYEBn23UffBmc fJ7G+tow4u6ey0yYmVqUmpXGDfqF4X93OABwxpk77J6zlJA1ko7Z791hzJrSPETonS19obFveRR H2Xb+XWEQ/JHU0fSI5wGLKipq2xY6HorRJxufMd5jynqGKIf9gipUcdj72oyLiLNRLy9DZ+0vrN
 GmQ7uwYx+iFPu8CdCCNNmC/kKobHyAGBCtC8P547WStFhdA9CqnvIdNZCChzk/9/JAIo7DYg
X-Authority-Analysis: v=2.4 cv=K5EiHzWI c=1 sm=1 tr=0 ts=685438ce b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=t1flVwG83pf4r0zF2HMA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf awl=host:14714
X-Proofpoint-GUID: 4GzddGZVZjLVuNOZrF3UBK8AvbaPZzoc
X-Proofpoint-ORIG-GUID: 4GzddGZVZjLVuNOZrF3UBK8AvbaPZzoc

On Thu, Jun 19, 2025 at 02:03:56PM +0100, Nick Alcock wrote:
> On 16 Jun 2025, Eugene Loh verbalised:
> 
> > On 6/13/25 10:33, Nick Alcock wrote:
> >
> >>> Note that we declare the skip count volatile.  The compiler might
> >>> optimize code that uses the STACK_SKIP value, but we will subsequently
> >>> perform relocations that adjust this value.
> >> ... why doesn't this apply to every other extern global variable in
> >> get_bvar()? They're all similarly relocated...
> >
> > Right.  There is potentially a broader problem.  But we simply do not have evidence of misbehavior in other cases.  Ruggedizing
> > other cases could be the subject of a different patch.
> 
> Aha, OK. I was just wondering if there was some extra reason.
> 
> > The problem in this case is that the compiler seems to assume &symbol!=0, which is reasonable except that we violate that behavior
> > for our relocation tricks.
> 
> I wonder where the code for that is... plenty of symbols have value
> zero.
> 
> But, really...
> 
> > Consider the C code:
> >
> >     uint64_t dt_bvar_stackdepth(const dt_dctx_t *dctx)
> >     {
> >         uint32_t          bufsiz = (uint32_t) (uint64_t) (&STKSIZ);
> >         char              *buf = dctx->mem + (uint64_t)(&STACK_OFF);
> 
> Hm...
> 
> extern uint64_t STACK_SKIP;
> 
> So we encode information about the stack size and skip value by encoding
> it in the *address* of the variable? Is there some reason we don't use
> its value? unlike the stack offset, we're *using* it as a value, not an
> address...

The issue seems to be (and perhaps this is a cross compiler problem) that e.g.

extern uint64_t PC;

and then code accessing the value of PC (e.g. foo(PC) as a call argument) will
yield:

  50:   18 02 00 00 00 00 00 00         lddw %r2,0
  58:   00 00 00 00 00 00 00 00 
                        50: R_BPF_INSN_64       PC
  60:   79 22 00 00 00 00 00 00         ldxdw %r2,[%r2+0]

which shows that it is interpreting PC as an address to a symbol, because it
loads the address of the symbol and then dereferences it with offset 0.  So,
we cannot plug in the value during relocation because the only value we can
put there would be an address where the vlaue can be found.  To get around
this, we "use" Tthe address as the entity to store the value in, knowing that
we *never* will interpret it as an address for these specific externs.

> >         uint64_t          retv;
> >         volatile uint64_t skip = (uint64_t)(&STACK_SKIP);
> >
> >         retv = bpf_get_stack(dctx->ctx,
> >                              buf,
> >                              bufsiz,
> >                              skip & BPF_F_SKIP_FIELD_MASK);
> >
> >         if (skip)
> >                 return retv / sizeof(uint64_t) - 1;      // branch "A"
> >         return retv / sizeof(uint64_t);                  // branch "B"
> >     }
> >
> > If you omit "volatile", the compiler assumes &STACK_SKIP!=0. The emitted code has:
> 
> (which is a reasonable assumption if not freestanding, I'd say. Why
> don't we compile BPF code with -ffreestanding? BPF is almost the
> *definition* of a freestanding environment...)
> 
> >     *)  no run-time "if (skip)" check
> >
> >     *)  no code for branch "B"
> >
> >     *)  only code for branch "A"
> >
> > If you include "volatile", however, the compiler caches &STACK_SKIP on
> > the BPF stack and later performs a run-time check on its value to
> > correctly execute either branch "A" or branch "B".
> 
> This feels very mucvh like a workaround to me. Does compiling BPF with
> -ffreestanding help?
> 
> I mean it fixes a bug, so I suppose it should go in if nothing else
> works, but using volatile is almost always a desperate sticking plaster
> and this feels like one of those occasions to me.
> 
> -- 
> NULL && (void)
