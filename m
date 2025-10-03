Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D100113635C
	for <dtrace@lists.linux.dev>; Fri,  3 Oct 2025 03:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759463592; cv=fail; b=CgU/fHJN0ry739ghUEnOOhNjzqXP0CMlkN+qJkWfWkch+o6ocKj1Kix1V/TvLX54AJ8qbnFiZnpAh4z2N1nMyi5L2joAdnCuw+bFr43rvE+vuoGCkJVx+9nwuYItarBchvr2IkHBFIYsJzknG/YHg3CMj9Rl3hsjvkcvuHv9+TY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759463592; c=relaxed/simple;
	bh=TaknmOlIoB2MZ+iZZMM3/UQ5pDQzs7J1M1pZ+peiupg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=P5ud1z3apbM6FdzEhGAXUMrZTbU7fIVgVmSDImp5ooUwAVdm4mpdW1LD8608k8NYpUgltqhT0rYQbwrWHfATAz+O30/8gcaC5PPKLeG7AM0vh4dSF7INufPYrrHXNnAfmqttSlBE/YgsV9F8E+cDMOZ7S7bUa4CTG/zD1rI7mRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FDZUCZz7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BPonLASR; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FDZUCZz7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BPonLASR"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592J1pmB004377
	for <dtrace@lists.linux.dev>; Fri, 3 Oct 2025 03:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=LWjr9NtTqVPkyjAfFw
	H55Ulj3ouDDt7uOrznrDVraPU=; b=FDZUCZz717FWsEO39r7Bpydytyq7P3V+sO
	aIbpcRUuBU8RqWDVi22gjcoGxrZQm2fem6brA6ppxrVDtaMDwh0Ih09GYZ7iODzx
	FT44450AubDd986xZpaOkPlSXEM06v1jQIm9VmbQ6EDkNNcfyV90FuyUcGJs7sFJ
	3JCjUXAJw6h2Qcc/nKDQ9G/vbH+IaNwKsNkSAWyMQU3NO6ebdpG+OkYCyxolHP7p
	rvdYD1Aobwlo7wsWScvQLnwJBbbRNwReoXbIaBfN779frA1vedZ0HJUh3TLBUrrK
	XBX3BFU8stfabQXkt09oDzeagfnSdIrmbtvhkSrDMLWyPsyV1NzQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49gksxcj6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 03 Oct 2025 03:53:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 592NoE3d003453
	for <dtrace@lists.linux.dev>; Fri, 3 Oct 2025 03:53:08 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012038.outbound.protection.outlook.com [40.107.200.38])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49hw18hpsw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 03 Oct 2025 03:53:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5vdzsv5AznOgf4MGkWVUQUwKfbGdIOiXCq006qM8fVFtHN9x+AqdGKwt0sH22XPSZwgYAF9suDVXq4CbBHngG5M+V8429H+fOADxgIi6gCqW6neTHc2BwpmZam4pnklzEOXXFkksDC9ydqcSVHE79TzRYykHdQaxlKGeHUtWIo0mMBBNnj+80tYnEWQVkhakh96GAIwk8sepDe5Y5/YJohb5CUQjT9x+LOP+nHnisOEft0iYIVTleMMwAkoBiwmJBj/YS3M16BVnfmyMFVtS4JC5B9MrQuSa9rKAO0phZmbsaZT39QhmhB0Tq2VCxieYhWSxXBkkgMUedku23Q5GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWjr9NtTqVPkyjAfFwH55Ulj3ouDDt7uOrznrDVraPU=;
 b=dXDjqTWy8rKaMKy2RHYarLmXC9HIfDXBmA3VUYBHDDZwkMQm1gRBiQGxL17CiFFrVrvvOiEOcVOX4HHbc2EKNv8BbsWcQ1Lq4XVuvIm/34+j+PNGE4ofWDtVz6W0OEWIpRf+qdqABOUJMCkFuGTJV9LAPC15tHyo+yfVVVezNRZyrgdBOVi+E4Apq3mh+kY5tmtMLa/q7s6pQWwMJtbZUaAnSPPA7A7dX8+aKFLAlmi/zjG0dOQYyNogwTr83NNyQCgMDR7q53ekmFPOnJiCoE02maaPLO5F9Wib1xZlJ2D9yo21f34wMjHEj1wdN10aa4a5pLBF8ZRV9J1ybDdDYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWjr9NtTqVPkyjAfFwH55Ulj3ouDDt7uOrznrDVraPU=;
 b=BPonLASR9WtkSzfk3m+ji31OODEA0OGJxIYeImOkVL1xHREF7UbDuiX0ZCWEO5adGug2V9dwg4r8ViSUyh9I5W8HHG0fbOaWR6HEBZhvrx82HbZU+7Tm78WeeoSo2vaSu2fMOIipzSKbLu8FQFRDhsn9UijBiQH68QSaJtgwniM=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DS0PR10MB6848.namprd10.prod.outlook.com (2603:10b6:8:11f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 03:53:01 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 03:53:01 +0000
Date: Thu, 2 Oct 2025 23:52:58 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/5] test: Adjust skip file for lockmem problem
Message-ID: <aN9Imhcv4KweENK1@oracle.com>
References: <20251001062418.6902-1-eugene.loh@oracle.com>
 <20251001062418.6902-2-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001062418.6902-2-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:208:36e::17) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DS0PR10MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: d3ad2af8-b709-4d77-2ac7-08de0230596b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xsrJ+wc3oe2oiQ6XMhF27IW01caCuIcWpMPDuhwy0WFkMu3eIztCCwF+KIlS?=
 =?us-ascii?Q?dfJDxS3hf7lJ1yMHPgte9sTllXr+HPwNscYgzNaqJl44idCfR/NKm9GtIFma?=
 =?us-ascii?Q?FOwARi2q2aeMbI2Mi0TT0aS1el414qAF/E8rIp2pQGnra7o1qLp667K60mP6?=
 =?us-ascii?Q?wIptOtm74lKIGSNRkEpIp2eh5BM2iFsv/fBqQwzfpjwXuV+ByP9VmsQT39to?=
 =?us-ascii?Q?QrxjvnLEvkbL00XnY9weLRjEK58LjHgTnguvQ1bMqYjF3TNLtYeBbUTqf6U7?=
 =?us-ascii?Q?ILzsaFhmOFZzdGBzqtbJj3HAcijji9DqBkaflXMDgMDt4eeYyfNKcPQGZxdP?=
 =?us-ascii?Q?awvbBE8/8Epkf9Et3QKQVpLtxoV4Hxlu1CRTN7+uhDnUfSTOqeA3jmYijKh3?=
 =?us-ascii?Q?HIkF2rzciXW80YdYyQluZVHNOyn3xp5mfSjWKnRNhUjaHwfbqQ0eMrqZ/3F5?=
 =?us-ascii?Q?6S5K1zPa6G4XdShxqgGixKMsGiKkGbm4bBlESVfUPLRmjhpiGA+08IA0vbr5?=
 =?us-ascii?Q?nLBcwnuLAM1JPv4Vq7oHlfZRy8zyCVLAydt5UmGoTG4E0Or/PH0tcp1u4k9z?=
 =?us-ascii?Q?q1A0z+i4Zhr8AL4LmBQwxrICAvC/gud6tJNUwseKgkyNdgua11925lyT+auL?=
 =?us-ascii?Q?A/GBf875v8TlkDw42lfuSi3KiItEdKLGAmLp743aAqEyeeZmyCR5iMpPO1pS?=
 =?us-ascii?Q?DVg8+gAtDmW5Q6cAxXWssDRMIMUJqFhSdf/Hotko9PTFtdAlRTshwNnWTH1W?=
 =?us-ascii?Q?lKWA821DGhpattUM6YPfYI1qT5A0CZNr+3RYSUwIW8ruf9E6Mcg/NEbasK83?=
 =?us-ascii?Q?BvaNQk8y761at6wOa0L+spXS6UYkYrZQHBqn1nyjO6Aae8R2ljzSL/Hde0nN?=
 =?us-ascii?Q?lzX7eJi68ygaBCH5WTPx3Mf+tA5cYppwypZdkHgREMagyF8ZGw6c3r//lN20?=
 =?us-ascii?Q?AwvgWonmrkkrRSNpR/QbaYLLLThF2d6I8O1iNLH2p/CmVv3ANhWjAx9sSLn/?=
 =?us-ascii?Q?vUsM0f2T0ctTtByi5TGNYIDugboVKwEjhAmLq0NUJtAkYcJ5DPKHRKw+iuO9?=
 =?us-ascii?Q?cU3xrXqW1TTpXq+IkzZMmX9RWRlbGGtLnKZ+TrdR9ZtU1p14+kpMk881S8aP?=
 =?us-ascii?Q?LFKO2cLjgxTZZAm76ePpq7bM3Mef1VVoHiMw2/cw2TXk04zCy0skghr6bMR8?=
 =?us-ascii?Q?F1bL/ctnOh5LIBcqLInkMZBst9MAsFfoCvG2qZ1S0sjEv4hHZJ9rLMTYaCrW?=
 =?us-ascii?Q?+YCvUEh3dr8TLqPKA5+JjuWmQ676hvwkFL+7gHthW3/01p7vu4o2Ayq3en7/?=
 =?us-ascii?Q?9dSH2ztSZ3XJ/sMcyTkr0u+0xn/j5Jm8kblliL4MgmCuBkbRUioa2IsW8QFS?=
 =?us-ascii?Q?kkRZX1IuGNZBHM0xmULwWFlEQ9h+ZGF3o6+oevay1GcA74Drc8y/N487douD?=
 =?us-ascii?Q?UWOpu11owtbcF4uCH9ZcHi85CEVlS/iz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kBVbuG/8WtiaZ2xBzDVavRGLgECcaOyxpWijdCUzyK6fOuuJJHQxEkGFvWO5?=
 =?us-ascii?Q?EZujPETYAtYaJHKay6M6tVJqFRNNVqA+FNbZK/5DIvrWAs6IucnmxHjp7iZd?=
 =?us-ascii?Q?jHV5SRSoXc5gecxvBNXKrq7MO6iE8O2ao7pcWd5F9anBuWqwVpFfDxUtPsUO?=
 =?us-ascii?Q?AcCdDxNLa1a9GgQFggyUcevhQH0no3x9McAnqzBcFA1EjGzSMv+NDrdKkKqW?=
 =?us-ascii?Q?roNQGXpnyqKcJ9W9rI81QEp5UBg+iwmv1AP27x4FWTUjw/trgs7kOOeqa/hh?=
 =?us-ascii?Q?29skZbYPLJDVjkF7/BKTSwldt99OeNM4ERcCuCY2Mf7TWCbAQ/ngS1FENqvH?=
 =?us-ascii?Q?tM7UuSdPMUIfSVtjSUe3GqmWGX2u0t4RCHuDzdW4YOSi8jTyyXdLqCgRJ6/Z?=
 =?us-ascii?Q?KHhvY3BJ4gAHeH4EIx+PjecDuwpUEykXdSwiPY9yE/KRoGHzaB3cNyiFxs1L?=
 =?us-ascii?Q?nX7mwqyTNmOIbIV2N2QtUrQDB75YDszJanYJWugfsLlOG9F+c8k90a2uMTpi?=
 =?us-ascii?Q?n5WcIFVirWOLwDVT674Qs7lRgbOCpdeuwHUWYtnFHoxqMG03xZ6hkNU7yFf9?=
 =?us-ascii?Q?ASyg3qJN2U6r0mNrhOLkZZLZLNJPXlanqqOjh+Fs3Bz3l5ELTB0ZdJzv7Tmf?=
 =?us-ascii?Q?ZzfzBq3w3gnBRINdrtkockQ9GCoLpPm1mqER0ZfoE5em1dHMqB1xQ51DCTNI?=
 =?us-ascii?Q?7PKCy74rY9pfIdWiDsapypyTDJzEe8STA1j51tuRenHJK8dhmR08senuzcZs?=
 =?us-ascii?Q?qMQg3Al6kQ+zKv08JCRtiFGDG2Sw9KT/B0BCYAUADcgfSZDe1BqljnbmIg/B?=
 =?us-ascii?Q?d+bEddChCT5TszbKRiQWXAlyGqTp3CPZ+40yuoHUbruujkGBU2FwV28lkH61?=
 =?us-ascii?Q?Jy9UEkssMY5reDp3EpaM0bgWqQQ+O5Kapx+JfFG3x2bAX8bamkuelonkna1s?=
 =?us-ascii?Q?sWEWEd19horYJQz0IYJPSt+O1ghjRisyQYkZwZL8u2i5My7/UkjzJk8UJz5b?=
 =?us-ascii?Q?0Qhg9knR23030f9tW+dOzzu4KWTnJMKMMRdLAqNQqrf0S7yY5q/5er2qZj/q?=
 =?us-ascii?Q?0KmxXUmxcjXRFmE2M0pL3vlQrWV1/+tHERF3kUInT2957l6i6JD8l7903fAc?=
 =?us-ascii?Q?I15dbk9uF+nAG9JIJGNIzoOM8RnApPJKCXrws+JVqmpp7HoL3k5+wusJfrId?=
 =?us-ascii?Q?Dt7RCH2TgqJgeDXR9ebvMQAeg+1nhh2Oc6c/OTRSZoxajn3sbS+A+iOq2lK4?=
 =?us-ascii?Q?i9HvDcx7vKaZMmf36i6mK1QGxUFX6ELPQ6voab0KZZAGZfoDsfdF/DY77ul6?=
 =?us-ascii?Q?dTMDkTPcI1C9Coge+mJT7G3KsejPHSef3CEekj+u9DvBdfnLa3DmS0Isr5SV?=
 =?us-ascii?Q?m/5Z5KBGTuOB2WkOA614QIc+FN1/hEHPdoN+FWfU4JA9QORUWCZY4CM90nOU?=
 =?us-ascii?Q?dpeHbpKcCu/ypFjfTmHQy3N7EwJp4VHC9DBp2pOWKaQI1QrKAiMo9GL7fjec?=
 =?us-ascii?Q?k2meQXg+K5YY2pZOnGOFcnoVTl4AOBkcR5HdSx6vO/UoFMTWRDuWuot76uXN?=
 =?us-ascii?Q?lbIdPIqdUtmvMx46Ms3f9bLYoOc6FQTg+vb6mAtyVMuYtna5E5BEiQ0iv6Ky?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	81/8iAPO072CIPLNKdhHQ+KCK0Ru3i4DFeVQhwv7oKx09Gb3VC8a52++sokydfBkM0VcgcRuE1Pr9GwB0SWBt4znc1UC3r/64ZjNC6jr0ZGvPGOzOnDTslZ7EYYC1RceNl3+dDHVDmsr1f9Eov6mMI5xuwwtCtDWGySveD2qy7XwL1QsrzKd7NgiQueakuu5eoCR8nt3SK8j7DOCq1i1wuWPiiCtlWM4aRENlAFmnACmqLaZ0DRlfgTUzXARXA8sBGnJW8jEVh1koXAqfhocYA+Rno+Iy/JSicoY+U0x6xJWaQaei8LBTHh3HxU6xvoTEiIz4d6E6Rg4wofkC2lul9KfpzP8Av11llDR03XNy5WTdNSa58K7eMBQBDSdi93lTEWJyfdeSdbjRHZH//cpGCHE1a91L1btAwzkHnLK0cy/to4BN6QLlRVIc8yGTy+5bU7VUgiOc9d1qzMv4isOwqE53PSmMhiYouQ8287pxGoR9qOSwDYLKXfvrTpXQukS5P1Q0+LiI75eWweS79ILnLK9Hwr2yR634Ok97Vo+ZI90g4J/YK6UxEZTiSr90hjD9bRj5JMzy+kunqnh5tHBqiXaWDTmjFkBpswAWET61ZI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3ad2af8-b709-4d77-2ac7-08de0230596b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 03:53:01.6912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sud0H2G+nxTcFEU7GEQMeJ5sNivN2XNQwTv5or9A2TR3yS6G5L6PUjmF/2bFGUNxWu8YrH1eGMHHSYNwQq15iwE7wcyN9zkBUp0YZWNd36E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6848
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_01,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510030027
X-Proofpoint-GUID: wsVMXaKrdScbMRYtNb7i6nfqAJ3YE1WJ
X-Authority-Analysis: v=2.4 cv=N4Ik1m9B c=1 sm=1 tr=0 ts=68df48a5 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=QTID9UftlI0lzaH8R6AA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: wsVMXaKrdScbMRYtNb7i6nfqAJ3YE1WJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTMwMDE2MCBTYWx0ZWRfX6VL1XCcNdWEl
 NzNHvBE7lnBfmNd89B6JB2guwkNFeY+4hr4/qgtGL5/sl62ofZ8rv1ISg4zInETT7YiNnNMdQzG
 dVT0ffWFlqopN2kYV2m8VgSdtRlW9EmZknEpsYiFEr0WdpRZk0w9D12S7N2Dnz+3YDa68Ii4c36
 5tlej47cdbFFuMmg2G+0hIoEnP4FsYvW3gTQlBplSSXDQGM5kGSt0n7RRZTeMsw9i+grIcosaVz
 uobf/U+ylA6KVjHQMvehl6lnN13RdEKeqDF8GT3NCiCV5C9SDKuc/zDASQYIpU0s2dl7AJLrTgi
 0DT6kKlQYWb6W1fTdYp/t+JR0CvZVvkMU+gMKfs5Ns0QJeEakseUIj5W6bbS6SpUqwmMVuxOsBs
 qwWRg/us9I3KxOA/MAebCxld+C7vqQ==

On Wed, Oct 01, 2025 at 02:24:15AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> dtrace seems to work for recent kernel versions even when lockmem
> is set too low.  The .x skip files for the lockmem tests say:
>   - UEKR6 (5.4.17) we should test
>   - UEKR7 (5.15.0) we should skip
> and so it starts skipping with 5.15.
> 
> Apparently, however, lockmem does not impede dtrace on RHCK 5.14
> either.
> 
> So, tweak the skip file to skip on 5.14 as well.

But this seems to make the assumption that RHCK 5.14 is the same as upstream
5.14, which I highly doubt to be the case.  So, we should not change this
unless it has been verified that upstream 5.14 indeed also does not impede
dtrace when lockmem is set too low.

> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  test/unittest/misc/tst.lockmem-envvar.x | 4 ++--
>  test/unittest/misc/tst.lockmem-x.x      | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/test/unittest/misc/tst.lockmem-envvar.x b/test/unittest/misc/tst.lockmem-envvar.x
> index a779416b9..494ac67fa 100755
> --- a/test/unittest/misc/tst.lockmem-envvar.x
> +++ b/test/unittest/misc/tst.lockmem-envvar.x
> @@ -5,12 +5,12 @@ read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
>  if [ $MAJOR -lt 5 ]; then
>          exit 0
>  fi
> -if [ $MAJOR -eq 5 -a $MINOR -lt 15 ]; then
> +if [ $MAJOR -eq 5 -a $MINOR -lt 14 ]; then
>          exit 0
>  fi
>  
>  # Somehow, UEKR6 (5.4.17) has problems with the the locked-memory limit,
> -# but UEKR7 (5.15.0) does not
> +# but UEKR7 (5.15.0) and RHCK 5.14 do not
>  
>  echo "no locked-memory limit on newer kernels?"
>  exit 1
> diff --git a/test/unittest/misc/tst.lockmem-x.x b/test/unittest/misc/tst.lockmem-x.x
> index a779416b9..494ac67fa 100755
> --- a/test/unittest/misc/tst.lockmem-x.x
> +++ b/test/unittest/misc/tst.lockmem-x.x
> @@ -5,12 +5,12 @@ read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
>  if [ $MAJOR -lt 5 ]; then
>          exit 0
>  fi
> -if [ $MAJOR -eq 5 -a $MINOR -lt 15 ]; then
> +if [ $MAJOR -eq 5 -a $MINOR -lt 14 ]; then
>          exit 0
>  fi
>  
>  # Somehow, UEKR6 (5.4.17) has problems with the the locked-memory limit,
> -# but UEKR7 (5.15.0) does not
> +# but UEKR7 (5.15.0) and RHCK 5.14 do not
>  
>  echo "no locked-memory limit on newer kernels?"
>  exit 1
> -- 
> 2.47.3
> 
