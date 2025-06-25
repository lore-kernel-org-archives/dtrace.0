Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB9122083
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750824976; cv=fail; b=BOBwjnuHZh9pV2Lyp0XP+2L34lPdG04Wh+RONO0L+6X8UxUGNjqKEdJWT3U0mxXztQD6HrT+dcr49GtwekIS5YMmnI3SLRXPEHNIqe+kINuAK7BKiOojNrOyx99y3asBXpl1giUAK1GaWYxO/JHnYR6sbvq3058LUJ9WpiV7qIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750824976; c=relaxed/simple;
	bh=9oK4vSptLuzmcJR5py4FIrRV6qDuzAxzAPPsfIaDqRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Rw9Ro6UodAkjuTR9Fe5GOY8mE6RvszVd6ODajX3CiXLmOdP/go+55aOepa7wk2rf4b5w8yR1g39O8VoicNj8+XumQo2s148AUS0JwH1+G0jS7rumilz6LiWjJq5SewGe5i12m/ZGw0BLyKXlNxsr8E6Rv8PeF7zxqwzNBgbeJlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OM79kkCy; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=e2XY49KH reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OM79kkCy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="e2XY49KH"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OMiewT026976
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=pvELdydwi2AXTcTPdCkMNzV1l/Alk7JqvDzbUum7Bro=; b=
	OM79kkCygegZr5Q5W+jYSlxNshWNNoR9EN8d68TLq3W/OETEXZEic1Mo1junmNn7
	A37Mi8yBDz0REMtTrBjno3m8/nabtY6MhSlD5BMw/mzVnabmphCnV0QIOPBduv0M
	8PdcQzBC4tRpsAVmzQ6QvjeIw3b0GmIPatfgxeaO7Fp35AKvLkckO+9i86BlqDdX
	5OYty4WzULrg1CyVYjmGlrZx5jg0tLfT1yRSVOgTUrZsDm6jsNJ4RBIkkqschjqK
	IuRI5dmIrJM9QTQL/WPHwxxUGWlset2P8Yo2o0Jf33MpJ6I2X06EJl8i7ezKVeRp
	ivOGFG9LCFrpZO8V+lnPKQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egt1dbqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:16:13 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P2LN1u031306
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:16:04 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehpr12pa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:16:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWwy0EuU1jNmrE2bQ2pQCWRcuuP1SpVndoufS/a7oDf0YU17M7aE4s5vTn07zJVBVz+QyvyB73e1hycJOxyCkJCbKfm2CrrlWSUA8TnhGCFd4IrEJ2AvTHdMsEy5eQe7JbPL+pi+6R6QUdNjsj1dM7zk6TOQBDlOYReG4piBxnpGXJauMxOIG/AZY0mdnz40H/TI70FBocGP/cefwfBuCei5Wts2wyV/MFt1O1U1wKQZXAJBiXgHKLq+veBfMTlC05QfP/mSIT9rXXPyX3mizZyYA7KGVuxPNyKvpOWdFznE8mV9OmEwIgZUUBE/0dmyRQEB4h4Xeeak+zCmX/i0vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1EFmVj9Dpyi6GUkB+FzGXfjgplHJEWkfXT31REX2U0=;
 b=Y999enVdKDVUeFkxN+8TM4mlFQQEvhfEIk7I+Z1vPKxvu1DOjr+AODBvRNEQglVfA9UIC6L9dedx2oSDEvLhj6hd8gTh5lK3ScV04MKS7S11siyG9NAzRUGdH2LWwx1ibdnV+H5nRyXWQwAZeHDAmN3K5ehfgCB/HSsV+Q3hisibbTH91UU4s8GlcfmIhAOK7h0k41xKboBuJT1OAq4chQGbWPsfvHTNd886R7dn1mSDnQRK48sumyXX497sZseES3v++ImdqoIvGEeFcy/b/PHebMXmGkY4P42CjQMfQ6UdS2TRNolXjbsgv+29BbZSgC1dbw3XSAbUdtaeflCjxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1EFmVj9Dpyi6GUkB+FzGXfjgplHJEWkfXT31REX2U0=;
 b=e2XY49KHUWqfMf7wnJQI7w8vmm8F3QFF6uBNtqQ76nvV1tMZcCQbUEtPWniXvMuMEo2hI715J22sHoRMnIAGrHZ6dVCtA9dQVxrzXbayZi6SsKaFYjlHyXISGBwxgvxg5kUOGG2u/X0uERzmSz1pRymXBY50fmq4p8vmDzchtV0=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DM4PR10MB6886.namprd10.prod.outlook.com (2603:10b6:8:102::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Wed, 25 Jun
 2025 04:16:01 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 04:16:01 +0000
Date: Wed, 25 Jun 2025 00:15:58 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH 08/14] Test: caller and stackdepth tests
 for ip provider
Message-ID: <aFt3/kgGGDZi6+ft@oracle.com>
References: <20250522180118.27343-1-eugene.loh@oracle.com>
 <20250522180118.27343-8-eugene.loh@oracle.com>
 <87v7ozbspl.fsf@esperi.org.uk>
 <fd0c08ee-8efd-4728-fb5f-06e354b2ee1e@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd0c08ee-8efd-4728-fb5f-06e354b2ee1e@oracle.com>
X-ClientProxiedBy: BLAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:208:36e::27) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DM4PR10MB6886:EE_
X-MS-Office365-Filtering-Correlation-Id: ac220077-c9b1-407d-8609-08ddb39efea0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?s47wlWCYeETLSLYOZPgI0Rk+PP8rr5S4p/kTqIjpy9qeh+p9kfwO9eCBrx?=
 =?iso-8859-1?Q?hsuHqZG4jNm9Sp6KvXRxI+W2arJtk6AoBkuCXw+CHlhjXexNWo1H+TXwVO?=
 =?iso-8859-1?Q?khZaJBgc/1gPbmR3WnwBaX+3the0cLiTyVAeWNriTLSWZYsxAsLOFx1hfG?=
 =?iso-8859-1?Q?fO4D9L72j0oqm5CJK1JKcZEQbKWqGXb/NawpAf7J5j24KGzyPfL06SJIQu?=
 =?iso-8859-1?Q?nwaU4hUq2iZZimxD8LLC2DTj3IKFVsS5KM+r3oHjMnfhYiq4+Dg0NWBeTN?=
 =?iso-8859-1?Q?7tzrzmCDiryiRZHUSxHQZq+8sBk3NCH8dNYxQHZJqZJ9j8+ad3Fgm2tl5k?=
 =?iso-8859-1?Q?lTR1Whd9puaZqnpRA7aV2WxydzEEq0duiAx9+IYdnYhP3hu+La2Z8WCjV2?=
 =?iso-8859-1?Q?lsN4yFJJhGVqQXN2GV+BR/GP5DLJe9C52u6Ga8peWfqPrOAPYRvI+Yy0lx?=
 =?iso-8859-1?Q?0ovZEmYhlvXt0NZm6QAUadBkxSmJTk6LzeI1Qk3nMP4eZ31+LLYelE7WiZ?=
 =?iso-8859-1?Q?HBcOZYUaaOCe+Ts4E29NoAM+WwUP9BhrbV0M97qSDG0eojwoHU/r+sPoR7?=
 =?iso-8859-1?Q?NQU2jr43m2nBZQ90tYozVW3yNrPXsHelykTq56Z8i3dLsIT7XPRwHBjtwh?=
 =?iso-8859-1?Q?ooNqXfTVJidhRiH2QJE2koSC5v12sRe7DK/24Qj/SNBxg/YYcdQ2xh4agc?=
 =?iso-8859-1?Q?713WEhe/rAiGD4JHs9tVd53hiZwvOcR3r1wrHoyR+CWMbF/t/11twX6NLr?=
 =?iso-8859-1?Q?PWYbrOAdCBsKtSPQGzcZir2QmRE+JdO7QjRr4PkDNzjVoWOm3nweVeFnxK?=
 =?iso-8859-1?Q?zeOXiMZZhBk1iRmNAuGXblb0bpNC2BNmYoEsBKwe4hPKPVRdpMIA8z5I4O?=
 =?iso-8859-1?Q?AyCq4FVIe0sBt6npizconZbYDQmjGa2UaaUIZ2lrE8Y++Acjo0FhmIGKkn?=
 =?iso-8859-1?Q?sJ3T5kc6Ezo5XjHPBGV9YkCALowGJL10xqplXXm/prnstZT27qsi8OOt1E?=
 =?iso-8859-1?Q?nxIFLnqDsq1e8cnITC3xx3mu+y5eJfbmX/tT4KA+Qg3xL3s0kfgDrhGpEH?=
 =?iso-8859-1?Q?Mg3trz3bamHS3REYFNmS+Cvu/3okDJODN+87aGC/MiqKeai+03IKqYbgpi?=
 =?iso-8859-1?Q?VtQ2OgbVvDAPJectPPMkkEa31utaDFGdDVmRLFvWcKQDBBXqshn1bivEP+?=
 =?iso-8859-1?Q?RaNYsYWFJ32tjNP2jzT6d8qZiAuV49aeAG8xtu5wFpEtjiqFh5u3BnGJNl?=
 =?iso-8859-1?Q?CEBXRHupUwV1KHbxqtQkFcJWtbq1uvMGytJ7kk8uaiJF7MJLPgW6GgcVrP?=
 =?iso-8859-1?Q?psHIdOvms60r1Dns+VYjYPfjgtbwdsI2qPIeCIuKkuSodpJppeDfCmW+Q4?=
 =?iso-8859-1?Q?70p/dBNxSBim/SbT+b67d7pN2Tuhr3R1VVVO3G9QIwvCsL2dC4wi2y9ODR?=
 =?iso-8859-1?Q?sLuBe2uLNXQINOU063JnJGvMWIx4yQCJjuYYqXn4UkoWWhdUaOKwsrE84/?=
 =?iso-8859-1?Q?k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?5Kh+L+GQyvi32CHY6dv+e1c1qVK8c4BCUJzs7/YV4hhzh+HqlLMGzuItmx?=
 =?iso-8859-1?Q?eqS1YFSqaWVldvIiHe8ctxTeocsSLCJAglQ62pYHE9xkAGMV6/gGUKbuMq?=
 =?iso-8859-1?Q?77YWzlqr2vdGJwGpJeey4yqOvf4gf4a1c6XBW/F4TgZJ8G5kNrzl7ytCs6?=
 =?iso-8859-1?Q?u+YuS8h6JQKYamJjP3RDXo3yiR+2bXB+osL0oHMMb2an/DVFuU87kyhFRh?=
 =?iso-8859-1?Q?yG0CQgTsc4MYvtt8zAYj94f4RkaUZDkq/SwruS3gmhbq145og543o+MuQ3?=
 =?iso-8859-1?Q?k+sSAoZ2DvggycspctydNc4iKVOkgla4SGGfiYPbur2LrWagwdBaTkeQOm?=
 =?iso-8859-1?Q?NWR/6CvXkUA+W20N7AJ80roNIXgbWvd3D56biaRBY7z2qNR5WDUJhVRRt4?=
 =?iso-8859-1?Q?VqdPodb5FXKcumzYKeLPSEzjs30M/Whb/sA4gI3De/R5pMuO5DGxffo9KX?=
 =?iso-8859-1?Q?r4cTkOuNOoMZpw1cVlDLO6xCvmVwGgzFFdciZrSV3qUT5cQ0Qfco10j8Lg?=
 =?iso-8859-1?Q?PgpBYPuGDeCJsS/IfV/7bNMyaFd9NT4/CO26mBItBkl670tZ6N0ejEIAcr?=
 =?iso-8859-1?Q?05abOQVuGrd7C1tjANeeoptBTBFrqek0k/nQ/6cJ5/rwlwlhxmA7onYnIR?=
 =?iso-8859-1?Q?1hxtpCqwvhDeao6HfYoh9+p1RjduSqvJ5ll+UEMINJPZhmKrsj+RgE2pmP?=
 =?iso-8859-1?Q?9Ft9TLyitt96djh1caIvi1H2E3B0DRvPNDol0QjE2yARvfvaVPbktb6uy4?=
 =?iso-8859-1?Q?a062oNlNvtnizTHYfbA7Uc314q5Z3YDRST+BhuKEPBgIZxOQBk3IzIAhGV?=
 =?iso-8859-1?Q?4wLucC9+uZV+z2EINy9Uq2tEcWMdVVZko7DwFTafgx87Q6151JB0EljdXg?=
 =?iso-8859-1?Q?nHGUyT1S/Cww3Oc5g4bSJkWNMzE0TN7oB0AXoBxFHr9xRGT+PWsWlsXbei?=
 =?iso-8859-1?Q?gDPDqVdXtNFD+XFpvhJ/UHW/uUUIaA+x55N/Mdll7INq7TY+Hfw+bb+Ueg?=
 =?iso-8859-1?Q?gZViN/7oRMW0vg0L8iyIoIsYnf47nj6UvERBgnHxwpxRoIMEc/Gc8OZDCG?=
 =?iso-8859-1?Q?idAZfWeu2ox8707jUi7K5M4bwhRWBINZGIoztZ/Zxy/VI/MbpEWxfGISm9?=
 =?iso-8859-1?Q?WmP2/kM7fHN5zDeDi7EJ9V+WdN2mI3y3omWBV62M1ivUyIgjw9PmaHFPzT?=
 =?iso-8859-1?Q?ofOznWek1US6DO3P5iTzdW7Sf/KNGEr5IiGmx40XjuIK9dGTT2W+RZSOCA?=
 =?iso-8859-1?Q?S37h2fUZFlX7R42Iku+rgeadxeuIB6Skd94aY+zRj2YfU45kb0pQ4WoMnk?=
 =?iso-8859-1?Q?ThRNDgHhizm2qxaiHwwNeIHNa8whWMGA2sBR2f0BOQuG6fPgz67GYpcpRp?=
 =?iso-8859-1?Q?Mr7FtolLauuH/q18u2QgAxkm5Ec9qzOXpRoN0tNQO5sD77ufWB2/nZe6Z0?=
 =?iso-8859-1?Q?czhnk/r183H8cRxRgwlrFy4m7Uar0zGhFaI7tLriifzylYC/2/ccE/jHbC?=
 =?iso-8859-1?Q?Rnl6KTWkVF6DEzw1KxPLReOAzjvvOJB0g7XYtMK/qsAqjKac/irJvBELl4?=
 =?iso-8859-1?Q?XUIDmwhzrgup1SDr0j8IlOnI7ifOPymFsI1pkfBQw7H0gOTLpw1EME9UUb?=
 =?iso-8859-1?Q?xU+tsWTblGl7bGkp+E6heltW/hC/WNFxtGVM/qcsSjBjkkHozeNOp/Xg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iT9xfarvjKmx6YHORAfkLmJVC1J0ww8huE65kG+vAPYsyklRsUZHuR4tC80p5zvfJRnBaf8QmAwcmbMJYSexgBh008gi8S6Cjo27z3gLLtLL2CnzqT38AS9ZgdYI2IfubehRGJkl+BUS0dUijiQfEWPAgSXPjVWf2kb/coP9/q4Y4pzMNavQV9tGhDDOgezquV6rj1ogTUcD5mcP3Si7sA+WB0F3lb6CTXTVU00jY3RkV+FIS4mjkdSPAWAO4+xOV8M2p6B4YDd+Gy722lndwLP8PmAOIAXcPCk5FFQds63kx8X/OyPtpexmh7VdktTh49aBEPqjdEoERL2GAf+Bxp0sUvw5z5TWNQt3S4eQHEtXtyloU2AznJYNENK0DzFg0n08xZ4fn3UIJPx+WW1BmQ7bgQwD99D1GClflrluTnc4QXN9iOzVINR/JxwDXBpCKkGN89GXlE7ns5Jvfupy/kI7UQBfPS42NoTh+ihP2ZVwWX/AcD+DI3CjydDGvOQ8NjH0Wwwrhnimum39DNc2YD3Mat5sWCt151MiKtE32CmPT3j83VkRXz78ip/bn/6XyQUoYq5s9bUn7VvopnbF0CeCh68Ltxe0ZR2+/FqHqws=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac220077-c9b1-407d-8609-08ddb39efea0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 04:16:01.5429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8AsEIGV54Cwq0N0gttli/Al/6ntgk6biWW1jXuXaebqHaMLBIuQGBqC6EwQZ9Zxh3k35JAhZ6cD67KJGOzyOJ7bDUgfmNodxkcs0xu00gng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6886
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506250029
X-Proofpoint-GUID: J6koFINTWvBlNWjmrBzVVHXiTemZMEz-
X-Proofpoint-ORIG-GUID: J6koFINTWvBlNWjmrBzVVHXiTemZMEz-
X-Authority-Analysis: v=2.4 cv=cpebk04i c=1 sm=1 tr=0 ts=685b780e cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=NffQCg2uM98ElqpcSf8A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAzMCBTYWx0ZWRfXxO4rH0YHAeQh uvDiMk7FSx6JQUjvn/bEgBqM3qUSHernfnpFZodwRTW5xuJaRAHGEmQ6bZSZfF78Gepf9U31vPN xb80wkSzD9HVE86aepfsz5oRr6ww6HhTZDwwX/Oolx8vrNhkeLtCcvtwEK4FHo9K1UN+umIfx+R
 vXpCWphEHosJRiXoEtfAxOcpyHpVpyENMbTEdGnHWyuVTJTS4Ztc/hgBITdBhQFLyCQegjPYg1J AJ/l75AimP7rXWKG3nm8msvC0FbY7CgoCgVLpcLotU9iJvDgjfrq9Rnvc3HUvcJkRQurcExzU6Y ox2+MvdZQVH0WQQ+/sbWroz7LGMo20Qkx+lfkjUuKmQTsut6GkPgoM/I1YtmA4hXeNmK0lEkzec
 qrua2cyPd03ZBiiMaEgyMFGq7yEDi8a8wrCRtfbfZYQrvl4qFvvQARAIEqKn6Vf/rFONhzAJ

On Mon, Jun 16, 2025 at 11:38:05PM -0400, Eugene Loh wrote:
> On 6/13/25 10:51, Nick Alcock wrote:
> 
> > On 22 May 2025, eugene loh spake thusly:
> > 
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > > 
> > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> > 
> > with the microscopic caveat below.
> > 
> > > diff --git a/test/unittest/variables/bvar/perlping.pl b/test/unittest/variables/bvar/perlping.pl
> > > new file mode 100755
> > > index 000000000..97c9b09e9
> > > --- /dev/null
> > > +++ b/test/unittest/variables/bvar/perlping.pl
> > > @@ -0,0 +1,8 @@
> > > +#!/usr/bin/perl -w
> > > +# Oracle Linux DTrace.
> > > +# Copyright (c) 2016, Oracle and/or its affiliates. All rights reserved.
> > > +# Licensed under the Universal Permissive License v 1.0 as shown at
> > > +# http://oss.oracle.com/licenses/upl.
> > > +use Net::Ping;
> > > +my $p = Net::Ping->new(${ARGV[0]}, 5, 56);
> > > +$p->ping(${ARGV[1]});
> > Is there some reason we can't just use $testdir/../../ip/perlping.pl and
> > avoid duplicating this?
> 
> 
> Thanks.  Okay, I did this.
> 

Can you please post the updated v2 ASAP so I can merge the series?
