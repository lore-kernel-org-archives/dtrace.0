Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237C1292B4B
	for <dtrace@lists.linux.dev>; Fri,  3 Oct 2025 16:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759507558; cv=fail; b=QDzzcpUH4kpQRPjqpwSONKIPFsM6A8i1/mdo0StpNserPyQpqHLPlkAW5DbtuP+nUCtJiaGYwRHlEPw5PpVFsyplV1OiKow1Lon1xCHYiqzS/ckn2Ls/AaMSUjFlKH+AZTAJJh8t0jO4F3rYqLzfyf5T4oorygTNza88HBkLwoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759507558; c=relaxed/simple;
	bh=+m4dCv4eiC5/xz8hl/iadgk95ZWLB14mb292x9u0fyY=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SXjviUjTFlwqFj85Dt5kc+sBEEba8UW7mLRGaBzfC/sm5LtLViNltTk2Mlzp/02/cm9p2i2qGhzRW3fMnUAFw4bb/HjigdV+ryM/bX2cbAgM9gHef9S4+y3TUIY7aB2QmuMeG98YQylcmY+F54TyTICgJvaAjFvCiCFQa096Noo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=j1J14MYB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CEixCYtR; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="j1J14MYB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CEixCYtR"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593FC5tK008003
	for <dtrace@lists.linux.dev>; Fri, 3 Oct 2025 16:05:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=9YSyC4RqHsTZj5jdgpOldPdWddPSnnsUYkxa9UTZQRs=; b=
	j1J14MYB92OyU/XFkB4UQewYgD8MPIgKTj/mEFGvvnfZnwZd5Jc6eNURnux7OnHl
	EldA0id+l7iQr4keNJPD5VR2vg2KmPdKphum8rfgEVKfVjiIqhEmjKlSsd/jlaJK
	IJMjyp8V+HG7TUQQP6F1Ex/ExAI3lHpcmRm5RwBm/6SclwV4Z1gG2JK8sJZMB3SI
	9ISGMaUCtmLgJzsu8osiTmvl+lvvki0Y/OkRWC4mEr/yGenWc+tYfdRjJE2Ggd58
	bFcRRkGBaYmit06TPweNcsqkX31q+kLZ7InNFWDFmIJTA3lX0FeJh72J1kdYU/UT
	ClvvEU2EnoLikJl2TnLeEA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49jeyqrbhw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 03 Oct 2025 16:05:54 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 593ENZYg029674
	for <dtrace@lists.linux.dev>; Fri, 3 Oct 2025 16:05:53 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012054.outbound.protection.outlook.com [40.93.195.54])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49hw1fpkwy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 03 Oct 2025 16:05:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a8pvIwp4zWNzJXy2FkU+pXrttaqPBdNhwvRFesX9cH69HkeACigUWTrDMHrqbHZl6NFvACFmEOTniIEzWg1yBhNh/eXGUyCKyvpVb5o63onpi1U7fMtjDv0DurR5uuAfNLqoMEMSJZEx6vgdS6/PZ+g8yowBCcDtLEkEHiN09c7LG1NzwVmU7N8fCv+Mxg+oCMpTVCxLG/JuINEsj8Fd9wQCk65incikdDw8kFnymp0kzuVj5ekG6isf4bT2xnXgUn0T7FGAPlLrWZyIFWl7hL9wZiB+RuCmZaEpVUxLOO1KWuwLb2Wc2agbTfu8zcoBjkAXzZhIZBtN7ZUTMVbciA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YSyC4RqHsTZj5jdgpOldPdWddPSnnsUYkxa9UTZQRs=;
 b=N+2F0Ye5VLxMCsAfN+27WwoofATPdiUsZxghII+h1fYkxIWNNiH55Bi0NRKzIMLlXsVK0RJqxYSyUq+bMCbiA9w1bHf+L/HGknm3AhvK2RSgSkyREyUcLCGMngdd5FaG/FTYRj46UbaDFbvh0GltbamwLY1UFJqzBd0zfUVIQ8jU6t60tSDVQiY1ycctb9mi9g17qlpDFNIkv1hU5k210g21v4S8BJf544sSfwcn7CtAIqaNJjeegmrHtqldbdtZsuty7Ni/pWHZfOeyPWfR6X82vtzv0B3WPElYp2eZxRgP+UEhQ/I4Xm8hGrXax8+xbaJMdYax3MtPVI89pKEwNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YSyC4RqHsTZj5jdgpOldPdWddPSnnsUYkxa9UTZQRs=;
 b=CEixCYtRkh5aMCFBA3U0UYnEf1Vsji9F3JAwJzZBmJ0n1mHtrsHJFMKKyOXUX28eqhpM1G2Oou7/kNDqecgTH7Kz1TajRuqUJzoh3cE6Ex1lFKJ/Q+V/FST3J1RbVScWgEcaApum3quhRkywSourkNf+1vOpEXe4bsBfD6ENIN4=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by PH0PR10MB4423.namprd10.prod.outlook.com (2603:10b6:510:40::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 16:05:46 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 16:05:46 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>,
        "dtrace@lists.linux.dev"
	<dtrace@lists.linux.dev>,
        "dtrace-devel@oss.oracle.com"
	<dtrace-devel@oss.oracle.com>
Subject: Re: [DTrace-devel] [PATCH] cg, printf: allow storing [u]stack() into
 vars and printf using %k
Thread-Topic: [DTrace-devel] [PATCH] cg, printf: allow storing [u]stack() into
 vars and printf using %k
Thread-Index: AQHcM9VpXzPZSpG6lUOiMPAC5MnKurSv5NAAgACZxq0=
Date: Fri, 3 Oct 2025 16:05:46 +0000
Message-ID:
 <SJ0PR10MB56720280A8F22CB49329CD88C2E4A@SJ0PR10MB5672.namprd10.prod.outlook.com>
References:
 <SJ0PR10MB5672C09310C10847AEB00DCBC2E7A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <ae8fe2de-ec29-80cb-bdca-2358ed7db9c7@oracle.com>
In-Reply-To: <ae8fe2de-ec29-80cb-bdca-2358ed7db9c7@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR10MB5672:EE_|PH0PR10MB4423:EE_
x-ms-office365-filtering-correlation-id: 52099932-30aa-4ecc-4462-08de0296b667
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?baldSCEDVB11zgSAAbheFsyfsUnQc0RQiooNg1muPB2bxQfUndwcNp5CGz?=
 =?iso-8859-1?Q?0Y9DlRn+HlTuQ+hEgbkmdyrCwCiSvq28vq1CUIa30LfSaItbVHX2sQDPQ5?=
 =?iso-8859-1?Q?aUsz9vDOBL8QrqV1WrYWUMqnQkzKGiT/3Kn9CiCIYs1q9DHDXa+8D8eexi?=
 =?iso-8859-1?Q?+FlXkuhyGe3e1E16wAJa7eAcQFzAWPXy/VbelcVO/72EDhyQUfI1ZSEUv0?=
 =?iso-8859-1?Q?Puhhb6iS3xrzfbxtor/yVcTkkMP9lK/ltzBir4f3l8sjqEjGHpzyTnBVyk?=
 =?iso-8859-1?Q?AWgOlltS9K7KkyVKllG2cyRZX8YJ6KFPopX5/vF9N+nNIqZLH/PIwRYSmk?=
 =?iso-8859-1?Q?cM9vW0xy8iwDwaRcTi4pbMtnMH9AJGK5B3QBf+2UwQS7fgq7UP1J8khk1D?=
 =?iso-8859-1?Q?rCoEkYHWjQS3SXsMUr/7wR7f1mu8QlZqkuYwZ5ybp9beM6EcMxFAEol7O0?=
 =?iso-8859-1?Q?o/7fZa7jjr1hpvBG2kUCq7qI16XlD6uBeptEUx+qc1jGzgN2MCUT1q51fR?=
 =?iso-8859-1?Q?ET3H0cySpPmRQTw1oCEj90CUpv9v8Kne9AKTK0RoMiX1SaRnsbivWqwD4M?=
 =?iso-8859-1?Q?yAcmX8XwEHoaH/720CByB7A1qRWtXSBG5JwcYtoZxp7aESsYzk0ZwwWRSF?=
 =?iso-8859-1?Q?5MAQMA7eHoQr/AZofBjoQ8mGWD5yX7ntzVtCicPLczU/+uOn68S/mtYz4D?=
 =?iso-8859-1?Q?kG7LvcfLa2SF4NySkTKsaWQFbdsckhQ0B/JZ/VgnF1yJ8GqtIt6rjDJkOV?=
 =?iso-8859-1?Q?8FYEhS1Vk1sLWZdcRwFi92HnfWmKM7H+2wM0439r1zDmOjLmFphRwgkt0S?=
 =?iso-8859-1?Q?dRVRiGBuGpAS1ObgXVT61I96QZTICL6g2InmMHuimrGFsaHHSD8qkFALEM?=
 =?iso-8859-1?Q?a+GTVsT6K6QAwwLVBkYh98Pi9BuX9nxDPY6OifM5SEUuHlEr5/iLCrwxl9?=
 =?iso-8859-1?Q?kFr9IqVmpDHiMd9PVaSKoyG7nF74J2uB/7JRPV1d4NdoTX+VMczup8S6Zz?=
 =?iso-8859-1?Q?fE/I0UkvHY0rh6UbUkQIqVqT7euz3rGnt9c3YppaQEvv4TSu4kGJxZAt4E?=
 =?iso-8859-1?Q?9XAOe0C7Rpi6FYSdtqvx/pnxPckEnio6ifs0VBWTgRZyZns+6Tj1WnNqz2?=
 =?iso-8859-1?Q?nHVKOjZRSH1/2PbGNEJj0lbd+hHQFz/StNJaLFPEDUSb8eU3VGxim8Hv1j?=
 =?iso-8859-1?Q?u/dGwhIJZfPtAs0q3jg7aWSyErqDqiIpyLh/PrPlkLmCtPYHTZDPhiZmZI?=
 =?iso-8859-1?Q?20GBIB+g6zGxr3qMp6qEi75lT0JnlzPiSybgPcbBFzeU0QUBR20vMMS3fO?=
 =?iso-8859-1?Q?91pPdwfODTsVGNYBvIEcpMKj1kPmxx1hjiXR08XfqeLaKKnwt2E24FRwyf?=
 =?iso-8859-1?Q?1WiS63HZRO7UzR21dMbNRTABW6waeICGv3w4k0jlp4pv2dgWb9pNlvFv7j?=
 =?iso-8859-1?Q?XqQ+a40URIakOUe8kBHNhOlxyhdj1Gh6NLeKboedykXadugVaN40WVCGtO?=
 =?iso-8859-1?Q?HnZLbSeilzWoeeYcfq6ligt5f1eWb4jpqrdaxyi+i1xx0FzrTkTVcAEsDd?=
 =?iso-8859-1?Q?UTx1IhBPGmDj0xqZjn+n1a7rp38T?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?wrB4lWzBkrQ38Wtps2omW43KR9s0KAUKpRtKtsKj/q/rWCSnpfjIslQ+LO?=
 =?iso-8859-1?Q?NZF83BfnbcTjZNVpMK6yG/q0gidPZFgxjVeWYu4EZL41iADCQtSbyGBf5y?=
 =?iso-8859-1?Q?/pEhtE3Bq6rqGNC2g6fX0FUZg0jo9iwhZxdMQn3rBRKHHdAHY3RPw0CQvC?=
 =?iso-8859-1?Q?KWra3PRwgZSVYtFZ7N4SX7zG45hCstdNXHdXx0SJkz766bVHLfrbOAzbRd?=
 =?iso-8859-1?Q?eF8LqB9J8uzqbG1iyktiGJCjBPeIh6rakFynVT4BYrz9DJojvbmQklEHLk?=
 =?iso-8859-1?Q?rIy6dWK5zYeMCQi1cMVsTHbD7/JpYbtCB3kwZPn2MOHyl2uErgFmCHqSPa?=
 =?iso-8859-1?Q?huxkfDSEZ6Gq0cxLDNZL1OrGVIEx8qyuFdeVSeT3Xp1wIoktl31Ch2+yUN?=
 =?iso-8859-1?Q?9MqUSMMR7VVCp6p/nhXs3SzeyN2oFfi6GFGxRAJQNiRzxo4kTWT1hd1ytS?=
 =?iso-8859-1?Q?7YDCGFHrWv62ImUlV5rxrgX+qVqZZmNZgXvLOK2fAJKJhQxhvIVVB5+VT1?=
 =?iso-8859-1?Q?5ucf7765Tz6SzCeyMZB7C9UtVkVDNz0fr7CSMa7SBrZhRnQipVhum6dsAh?=
 =?iso-8859-1?Q?+3BRm23J23nr+64gqFREiWYVSqEDXyAOON2LqNZXggWUiZpc4zhxW4W8el?=
 =?iso-8859-1?Q?gPQiIayL1c3bQX8oo48L7YkaVg23vEdFeS8I+6OzLHIhAu+3hBtb6gss4v?=
 =?iso-8859-1?Q?8UkzS5J3B/SuevzMGX4YRc5K9Y38J9tQ3LrXG04qaJ1LeKLcIH31OPhSNd?=
 =?iso-8859-1?Q?nHvrN6QW7GZjnVn3JISvJa06d32RbZv/yDZ3ugBMeOdjpSzO3jDTZ+lPLP?=
 =?iso-8859-1?Q?dFpmyrb0ZvtosNJniUG0DJl2v67utn+S77nf4eaOLckermLybq3Nuw9f/B?=
 =?iso-8859-1?Q?0SOLookRUVnQx/aJYA8ZB28dPwgn/V/tx2hE5H5cgNvaGJmo5qRZBAYNb4?=
 =?iso-8859-1?Q?H2OteEyFrHRgUsHhS9hYSk4C3JNGxVz0NovAzYtOPK8k4s9rXjhccMxRYh?=
 =?iso-8859-1?Q?HcCKO/4xZ8N+0zmxgdkNgJ5TzsUVnqwyikxM5mZrnm7IRVrVieAptQSRjW?=
 =?iso-8859-1?Q?EGr8UAvA2OiA6OiCnskJJtWe7XN4BmYjGynkHx9LOBqMUlJp7fhU2Yo1qS?=
 =?iso-8859-1?Q?trgBcxuOHQnpaeVTCalHMDZZSuM5jXdJj203YjKNYfgSqMiAqviiLqLOKY?=
 =?iso-8859-1?Q?pk7ZUyFnyu4Fk0BIuh/XewgTx3NSaG6oa/HKDaObfCzjiNm5za3cYJYUZ2?=
 =?iso-8859-1?Q?vT4m9W1Mdxn5BvI5eKiwrnuBnttTkANCdENzfT7a+BDaOcnK2qj5NgBl+6?=
 =?iso-8859-1?Q?mWjE5eYhfnx/MnPLONnqTtWS/j2mmfwR081ouB9rov0qesj4eoZwBUKWKa?=
 =?iso-8859-1?Q?QcxE3lMU/brXTIzLAyIGvyzHIaB2vLUjilcaXIpbC3fQ8tOhPuI8wCp4Ym?=
 =?iso-8859-1?Q?Z6abhEWgOXlcZr2H2t5emF3qsi3sJzYuRa+QTA38GKmQSVhqa76WsAy2NR?=
 =?iso-8859-1?Q?oHKCpWp0BwMwxeIfLLiO7Iah30CzSBKDDpP7yNAMPF7rqFkbPoX6Y6M7wZ?=
 =?iso-8859-1?Q?zkAirqYW7tyiXNog/MFJoNDnPXfzmi3Uhjv+mmu8Rl9zWRY7cpTSr88S9A?=
 =?iso-8859-1?Q?V7GQTYe+n9OgtdXfxmM3meFoviKRQwgONq?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wGx8N1Q5oMqxZhThaLt5ZHT33cd4pjNg/KzKFHgRuwUXtOdm3dFqDdip7uBII78fw5MMW/CVRFYczUTA9ELqNeh2B/Fg2NE/OHxP0nsEi2fdxLHA+x/cMFgdf3SPzokafgHfN+IW2SSqVUxqGOC1inwIbynrRXMYN65iIOsaTYY/r3QBAY7SrGoLQkheVV/Lj6aUDZgVxE8n5qmofZBtGmZtl72uwQAf6UM7EQ+LvrppVCJkjlGpJN9plROjT4RSA5oLky6N7hxredhsIKytp/cTQjxr2lPPOQyi95YgQOhrxJNmr5f6ye8OBSu7JqmA6dGtIfuX27t2n1vtaS6AUbvM6mEl9vFiV2QIVWdj2KNvE0ug3YA526E4W+IgEfYbwTvL06ywHj8hfGuFVpmxXHnpZZX8bLoM4jpOap6ZWekhm+uVY2D+qcqd7L0s1mXfjX7BN7oLVUsM8dPzbXqDgBt2uJY7UFSj7fFRKTiIgmhjvwjoBFjjbxAuEjcD0P3nPE8HQ0zfHb3lZy10r+bu/y+zjzg2ZCjLfoDkj61YRp2KQ2GvS1MFP+roy2y7frGCCrxomxAdNiXXM/vgsgZ5m/wa6eCnaNOZ/dRaeTlZXKc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52099932-30aa-4ecc-4462-08de0296b667
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2025 16:05:46.1302
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /FXj91NSgslaoJ5065sdjJjHVF1IO/Ka9blnXnzylI6alx9CzTUxtXRO3gAkox+FIeGbtI109kwiwSXPKsQ1rFU7D1v6GvHOSLoNI/Fuhk0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4423
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_05,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510030131
X-Authority-Analysis: v=2.4 cv=IPQPywvG c=1 sm=1 tr=0 ts=68dff463 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10
 a=yPCof4ZbAAAA:8 a=Y4NHP_3z03PpqooPdw8A:9 a=wPNLvfGTeEIA:10 cc=ntf
 awl=host:13625
X-Proofpoint-ORIG-GUID: igk1tYgy5t6L-4fLo90TdJG_30iZut0x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDAzMDEwNSBTYWx0ZWRfX7J97tDP6YJQW
 3LlVvT6C/qXFOm2k4JJjh+/t0ChGfLr8ndGX6WOs28bfK/6EbaeQI0n+bRqixVfcGIrw8dHurL2
 7MmZqzRfiQ6ZfXWp5DLP9aYK1Enhs1UIVegTMxXLXTLsOY3OQn1zbPHKE+gWPRIcTEL9V5/1lrY
 B295efumbp83X+ddrggO3+PLHrZUaoHFOf4uJ5oHCyLj7JVAXnxUitzaWCcg2BlKdBoTt/1OkZ1
 s3LWZLJqqJ0WmCCk4wYBSwgIuLKoDSO73sCsCD4B4GFrCkGQIVjFVu274sRVrDx74XF8UJu94XZ
 A3O0r2LcltSokAAJm9HzX9yDHFJLCzop9sVSge8kzpkaXw9A8VtxdDHIb2W651m+08+UFYJ/3W+
 uKv0IBiXCrFCt3VapbLVWSgY6f7xloUxX2dT1nWMF1q/a58cZRU=
X-Proofpoint-GUID: igk1tYgy5t6L-4fLo90TdJG_30iZut0x

=0A=
=0A=
________________________________________=0A=
From: Eugene Loh <eugene.loh@oracle.com>=0A=
Sent: Friday, October 3, 2025 1:26 AM=0A=
To: Kris Van Hees; dtrace@lists.linux.dev; dtrace-devel@oss.oracle.com=0A=
Subject: Re: [DTrace-devel] [PATCH] cg, printf: allow storing [u]stack() in=
to vars and printf using %k=0A=
=0A=
Wow.  Amazing stuff.  I wouldn't swear to every detail, but it generally=0A=
looks good to me.=0A=
=0A=
Picky stuff below.=0A=
=0A=
On 10/2/25 15:47, Kris Van Hees via DTrace-devel wrote:=0A=
> To support storing [u]stack() values in variables and as arguments for=0A=
> printf(), a type definition is introduced:=0A=
>=0A=
>       typedef struct dt_stack {=0A=
>               uint32_t        frames;=0A=
>               uint32_t        strsz;    // optional string blob size=0A=
>               uint32_t        type;     // type of stack (kernel/user)=0A=
=0A=
The name is fine.  I can live with "type".  But in pfprint_stack() you=0A=
call it "is_user", which seems much more descriptive.  I wouldn't mind a=0A=
change to "is_user", but again I can live with "type".  Plus, changing=0A=
to "is_user" means renaming the ref_type test.=0A=
=0A=
KVH: I'll rename it to is_user since there are only two types anyway.=0A=
=0A=
>               uint32_t        pid;      // process id (or 0 for kernel)=
=0A=
>               uint64_t        addrs[n]; // stack trace addresses=0A=
>       } dt_stack_t;=0A=
>=0A=
> where 'n' is the maximum number of frames that can be retrieved (set=0A=
> with the 'maxframes' option).=0A=
>=0A=
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c=0A=
> @@ -2760,17 +2767,18 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp=
, int reg, int off,=0A=
>               dt_regset_free_args(drp);=0A=
>               /* mov32 %r0, %r0 effectively masks the lower 32 bits. */=
=0A=
>               emit(dlp,  BPF_MOV32_REG(BPF_REG_0, BPF_REG_0));=0A=
> -             emit(dlp,  BPF_STORE(BPF_DW, reg, off, BPF_REG_0));=0A=
> +             emit(dlp,  BPF_STORE(BPF_DW, reg, aloff + 12, BPF_REG_0));=
=0A=
>               dt_regset_free(drp, BPF_REG_0);=0A=
> -     }=0A=
> +     } else=0A=
> +             emit(dlp,  BPF_STORE_IMM(BPF_W, reg, aloff + 12, 0));=0A=
=0A=
Store BPF_DW at aloff+12?  Shouldn't that be BPF_W?  And then maybe=0A=
don't need BPF_MOV32_REG?=0A=
=0A=
KVH: Yes, the store should be BPF_W.  Whether the masking (done using the M=
OV32) is still needed is something I'll have to test.  It seems reasonable =
but at the same time it is probably nicer to first make sure we are dealing=
 with a 32-bit value rather than counting on the store implementation to co=
rrectly just use the lower 32 bits.=0A=
=0A=
> diff --git a/libdtrace/dt_printf.c b/libdtrace/dt_printf.c=0A=
> @@ -569,18 +570,41 @@ dt_print_stack_user(dtrace_hdl_t *dtp, FILE *fp, co=
nst char *format,=0A=
>       return err;=0A=
>   }=0A=
>=0A=
> -/*ARGSUSED*/=0A=
> +/*=0A=
> + * The data at vaddr is structured as follows:=0A=
> + *   uint32_t        depth=0A=
> + *   uint32_t        strsz=0A=
> + *   uint32_t        type=0A=
> + *   uint32_t        pid=0A=
> + *   uint64_t        addrs[depth & 0x7fffffff]=0A=
> + *=0A=
> + * If 'depth' member provides the maximum number of addresses in the sta=
ck=0A=
=0A=
s/If/The/?  Also, "maximum" in this context is a little confusing to me=0A=
(since maxframes is a different concept and we're just talking about how=0A=
many frames we're making space for), but it's okay.=0A=
=0A=
KVH: Well, the depth *is* the maximum of frames that might be in the stack =
trace rather than the number of frame slots actually used because it repres=
ents how many values can be read safely.  Therefore, depth !=3D stackdepth.=
=0A=
=0A=
> + * trace.=0A=
> + * The 'strsz' member provides the size of the optional string blob that=
 is=0A=
> + * appended to the stack trace data.=0A=
> + * The 'type' member identifies the stack trace as kernel space (0) or=
=0A=
> + * userspace (1).=0A=
=0A=
Again, the code goes on to call this "is_user", which seems so much more=0A=
descriptive.  But not a big deal.=0A=
=0A=
> + * The 'pid' member provides the userspace process id for userspace stac=
k=0A=
> + * traces and otherwise will be 0.=0A=
> + * The 'addrs' array provides the stack traces addresses.  If the stack =
trace=0A=
> + * is shorter than 'depth', remaining addresses will be 0 and can be ign=
ored.=0A=
> + */=0A=
>   static int=0A=
>   pfprint_stack(dtrace_hdl_t *dtp, FILE *fp, const char *format,=0A=
>             const dt_pfargd_t *pfd, const void *vaddr, size_t size,=0A=
>             uint64_t normal, uint64_t sig)=0A=
>   {=0A=
>       int width;=0A=
> -     const dtrace_recdesc_t *rec =3D pfd->pfd_rec;=0A=
=0A=
Well, if we no longer use pfd->pfd_rec, then the caller dt_print_stack()=0A=
no longer needs to set it.=0A=
=0A=
KVH: Good point.  Removed.=0A=
=0A=
> diff --git a/test/unittest/funcs/stack/tst.asgn_dvar.d b/test/unittest/fu=
ncs/stack/tst.asgn_dvar.d=0A=
> +     assoc["a"] =3D stack(5);=0A=
> diff --git a/test/unittest/funcs/stack/tst.asgn_dvar.r.p b/test/unittest/=
funcs/stack/tst.asgn_dvar.r.p=0A=
> @@ -0,0 +1,35 @@=0A=
> +#!/usr/bin/gawk -f=0A=
> +=0A=
> +/ksys_write/ {=0A=
> +    # check probe=0A=
> +    if ( $1 !=3D "ksys_write:entry" ) {=0A=
> +        print "ERROR: expected fun:prb =3D ksys_write:entry";=0A=
> +        exit 1;=0A=
> +    }=0A=
> +=0A=
> +    # check stack(3)=0A=
> +    getline;=0A=
> +    if (index($1, "`ksys_write+0x") =3D=3D 0 &&=0A=
> +        match($1, "`ksys_write$") =3D=3D 0) {=0A=
> +        print "ERROR: expected leaf frame to be ksys_write";=0A=
> +        exit 1;=0A=
> +    }=0A=
> +    getline;=0A=
> +    if (NF =3D=3D 0) {=0A=
> +        print "ERROR: missing second frame";=0A=
> +        exit 1;=0A=
> +    }=0A=
> +    getline;=0A=
> +    if (NF =3D=3D 0) {=0A=
> +        print "ERROR: missing third frame";=0A=
> +        exit 1;=0A=
> +    }=0A=
> +    getline;=0A=
> +    if (NF > 0) {=0A=
> +        print "ERROR: expected stack(3) to have only three frames";=0A=
> +        exit 1;=0A=
> +    }=0A=
> +=0A=
> +    print "success";=0A=
> +    exit(0);=0A=
> +}=0A=
=0A=
Hang on.  The test uses stack(5) but the .r.p file twice tells me it=0A=
expects stack(3).  What's going on?  Well, I think the stack is short=0A=
and so we get stack(3) by accident, allowing the test to pass.  So it=0A=
seems that we need to probe somewhere where the stack is deeper.=0A=
=0A=
Also, fwiw, all that nice diagnostic output emitted by the .r.p file in=0A=
case of a failure will be lost.  We won't see it in runtest.log or=0A=
runtest.sum.  Maybe that's okay.  Just fwiw.=0A=
=0A=
KVH: My bad, the test should be using stack(3)...  And the post-processor i=
sn't doing its job.  v2 will fix.=0A=
=0A=
> diff --git a/test/unittest/funcs/stack/tst.ref_pid.d b/test/unittest/func=
s/stack/tst.ref_pid.d=0A=
> + * ASSERTION: Test accessing the 'pid' field of s kernel stack yields 0.=
=0A=
> diff --git a/test/unittest/funcs/stack/tst.ref_strsz.d b/test/unittest/fu=
ncs/stack/tst.ref_strsz.d=0A=
> + * ASSERTION: Test accessing the 'strsz' field of s kernel stack yields =
0.=0A=
=0A=
"of s kernel" =3D>=0A=
"of a kernel"=0A=
(Ditto for the ustack variants of these tests.)=0A=
=0A=
KVH: Thanks.=0A=
=0A=
> diff --git a/test/unittest/funcs/stack/tst.store.d b/test/unittest/funcs/=
stack/tst.store.d=0A=
> +     v.depth =3D 2;=0A=
> +     printf("%k", v);=0A=
=0A=
Wow, cool.  But how about changing this to=0A=
         v.depth =3D 1;=0A=
         printf("%k", v);=0A=
         v.depth =3D 2;=0A=
         printf("%k", v);=0A=
and then checking that=0A=
         the first stack is a single frame=0A=
         the second stack looks like the first one plus one more frame=0A=
Not hugely different from other testing being done, but since we're=0A=
checking storing to a field of a stack var, could do some correctness=0A=
checking and not just "well, it doesn't complain."=0A=
=0A=
KVH: Well, I am really only checking that it can be done.  Whether it has s=
ensible effects is less interesting because messing with what essentially i=
s an internal structure is unlikely to be a good idea.  Changing the depth =
is really the only potentially useful thing, but even that is doubtful.=0A=
=0A=
But I'll look at perhaps checking it since it *could* be used i a sensible =
way.=0A=
=0A=
> diff --git a/test/unittest/funcs/ustack/tst.asgn_dvar.d b/test/unittest/f=
uncs/ustack/tst.asgn_dvar.d=0A=
> +     assoc["a"] =3D ustack(5);=0A=
> diff --git a/test/unittest/funcs/ustack/tst.asgn_dvar.r.p b/test/unittest=
/funcs/ustack/tst.asgn_dvar.r.p=0A=
> +#!/usr/bin/gawk -f=0A=
> +=0A=
> +/ksys_write/ {=0A=
> +    # check probe=0A=
> +    if ( $1 !=3D "ksys_write:entry" ) {=0A=
> +        print "ERROR: expected fun:prb =3D ksys_write:entry";=0A=
> +        exit 1;=0A=
> +    }=0A=
> +=0A=
> +    # check stack(3)=0A=
> +    getline;=0A=
> +    if (index($1, "`ksys_write+0x") =3D=3D 0 &&=0A=
> +        match($1, "`ksys_write$") =3D=3D 0) {=0A=
> +        print "ERROR: expected leaf frame to be ksys_write";=0A=
> +        exit 1;=0A=
> +    }=0A=
> +    getline;=0A=
> +    if (NF =3D=3D 0) {=0A=
> +        print "ERROR: missing second frame";=0A=
> +        exit 1;=0A=
> +    }=0A=
> +    getline;=0A=
> +    if (NF =3D=3D 0) {=0A=
> +        print "ERROR: missing third frame";=0A=
> +        exit 1;=0A=
> +    }=0A=
> +    getline;=0A=
> +    if (NF > 0) {=0A=
> +        print "ERROR: expected stack(3) to have only three frames";=0A=
> +        exit 1;=0A=
> +    }=0A=
> +=0A=
> +    print "success";=0A=
> +    exit(0);=0A=
> +}=0A=
=0A=
Okay, same problems as before (asgn_* tests, but stack that time and=0A=
ustack this time).=0A=
=0A=
One "problem" is that the nice diagnostic output from the .r.p is lost=0A=
when there is an error.  Oh well.  I guess that's okay.=0A=
=0A=
The big problem, though, is that the test emits ustack(5) while the .r.p=0A=
file is emphatic that it is expecting ustack(3).  Well, it says=0A=
"stack(3)" but that typo can be fixed and wouldn't change anything. In=0A=
the stack() case, the problem was that the stack was coincidentally too=0A=
small.  That is certainly not the problem here. Here, the problem is=0A=
that we claim we're looking for ksys_write (which is the wrong frame to=0A=
look for) and if we do not find it then no checks are applied!  So, the=0A=
.r.p file should be changed to look for a ustack frame and to complain=0A=
if it is not found.=0A=
=0A=
These problems appear in the other ustack asgn_* tests as well.=0A=
=0A=
> diff --git a/test/unittest/funcs/ustack/tst.ref_addrs.d b/test/unittest/f=
uncs/ustack/tst.ref_addrs.d=0A=
> +     trace("Expecting vmlinux`ksys_write, got ");=0A=
> diff --git a/test/unittest/funcs/ustack/tst.ref_addrs.r b/test/unittest/f=
uncs/ustack/tst.ref_addrs.r=0A=
> +                  myfunc_z:entry   Expecting vmlinux`ksys_write, got   u=
stack-tst-basic`myfunc_z=0A=
=0A=
Expecting vmlinux`ksys_write on the ustack?  No, as demonstrated by the=0A=
expected output.=0A=
=0A=
> diff --git a/test/unittest/printf/tst.ustack25_pid.d b/test/unittest/prin=
tf/tst.ustack25_pid.d=0A=
=0A=
This test fails for me, but I think the issue is simple:  leading white=0A=
space / indentation.  It might suffice to strip out the leading spaces,=0A=
both in the .r file AND in the output that is fabricated in the .r.p file.=
=0A=
