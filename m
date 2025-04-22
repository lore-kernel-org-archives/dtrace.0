Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE56F28FFCE
	for <dtrace@lists.linux.dev>; Tue, 22 Apr 2025 15:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745335727; cv=fail; b=Lc+2AMZurXheWUh2G8Uq5sLXpaBYg3iyk5lYkhS4bsgcxooSdhmaTcSz1UVZyF1AOLP9xVLHADcizGzTQurTJtVt+9FwBa5G1DlJZpOwtxnZ92f3a96rtgGOuMJ3vZ+aTXEAiUAR2m8ptDfxvSjrAwVmSWjcpie+ClZStZ4rttc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745335727; c=relaxed/simple;
	bh=LqEJ1cZUm7xXDVtrJIXoXNbSL4DSR94tNmVEyFYtwLo=;
	h=Date:To:From:Subject:Content-Type:Message-ID:MIME-Version; b=eUffkhD0598fdwUy2WzlDOncl3h+LhQBgUBiwQ2cM0C+XRbBlVOrV1f6/k48CL2jgm0mTIzmwx5GS7Foy78pypRYzOI+kLn5v8W+hW6BUIgE02sm6Ko52LQpA1azaArn+vH3cPkscWGsbSrvEHY0cMgQWKwzDj+yiv9SObkI3M8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hk3h9lYN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fUw6TQfy; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hk3h9lYN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fUw6TQfy"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MCftKv005590
	for <dtrace@lists.linux.dev>; Tue, 22 Apr 2025 15:28:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=fMP8SLxbQvOIBjIOI5fu3Fg/KMl7nEqYwqqn+X3jluc=; b=
	hk3h9lYN+xh7zo2fG06lobZEqRbivfrz3QaNjIwp168OZ7bGCv+4q6L8NKNgaSL0
	jo3iqjDVKGU3HDVewjlkwoG398r0sB7UuH6tk4dnRckRVpv9aPg48rOxA3sIpCp6
	OQrr6RWkAihV0xOHz3UOqzZDcewe9nvCtaKvldGn0zF0b9RHX0twqqXiHZrfwM05
	FTc5noErqJ4ukFWRYKykqZDWKaoMqWlo5Aaw6/1XxvUn7ZynIprDSa7gtQLlNgic
	cTk1+e7uEiy5zpRRWJf+OC+VnOLWXsUrkA6gMwOwWb99zITPvU3L0GjQUNBVamQu
	kFrP4j7V59X2IzhctPamQQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4643q8vty0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Apr 2025 15:28:44 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53MEHOeW002890
	for <dtrace@lists.linux.dev>; Tue, 22 Apr 2025 15:28:43 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazlp17012033.outbound.protection.outlook.com [40.93.1.33])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 464299hyqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Apr 2025 15:28:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UvdpI1HjELY+uPYsfWR4x8COtzkt2ymQSzqhUj+FPoZ1yY5RxX2ncR9STdq1vp6xNZl3DpdDAtMmJd1pTtm2ThL0rviuO0oyC8yF4uYquEXDFldvYUSk9IOzOJa63iFvTORwMpzatxHt96YnXTfIJSM7tTfwarrThZFD3nshRZCQd45N9lvg4Gs3E1++vYSyoGw0SU+gONUq0YFq1xpEuV60FRLGzvTas7gctqv7+UWzwLP2URKH844f0KXFfJjoOszpd8OrPpUe9dbXZs8wR83fylbJ7yirEuxGWDhuNTa7tNg2VPca9hEavYyg0cjyH8Cy9dne4h1QOglgap5kQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMP8SLxbQvOIBjIOI5fu3Fg/KMl7nEqYwqqn+X3jluc=;
 b=mrqyUYst0i6ZV4yeHC7VnFCLSPmwStyXzlsHB1vvQiSC+KZb7u3JdU7ZKCje4KeeHQhK4gFdJrX6CYVJeyi5z+tSj7Zq+MFFztm/mCoioiwCjof612PItTu+x5E9G1uib91XLhThvgV6NH3MskkBI0AOGD+BrTh1IIJo7BgPn8EFpGWn9VBV/1kQX7liWWKsqX3nrxP9tdQdIMw+kFujBctgcG53FhvfDNylFo4nYBvbCsH27B2p/PHt8QF9EiUflLELITWE8MU44bpHeAkgiYTbc0G6GFo7wL2yUqcJiL6aaYxURhteHYrVgPRThZyWTi83e9LOcID+DT/Xa8cwMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMP8SLxbQvOIBjIOI5fu3Fg/KMl7nEqYwqqn+X3jluc=;
 b=fUw6TQfykBF/ZIdZZHUHKjyIyNcamsVuzM883k9FzPsneL1z2LeB6E1/cVeV1t/ciiDS8f+78eawdXa3jH2thuoSpgTlv2oj6ic1vvGhQ6YOKR3UGbml7z5zbGNoFU6Prd9gTFxeN7m4r3w51vZ4kO5YnHWpMXPMNtAjqEWZEPc=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by DS0PR10MB6994.namprd10.prod.outlook.com (2603:10b6:8:151::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Tue, 22 Apr
 2025 15:28:41 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%3]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 15:28:40 +0000
Date: Tue, 22 Apr 2025 11:28:39 -0400
To: dtrace@lists.linux.dev
From: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [RELEASE] DTrace 2.0.2
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:36e::10) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Message-ID:
 <PH8PR10MB6337A12909047C87A6209192C2BB2@PH8PR10MB6337.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|DS0PR10MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: 96f24724-5d4e-4e3b-bc49-08dd81b25c2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j0JEtw3g5uqMUdO/F/uRjfz8k1MKN9AuWdpPxjN/RlkBcipxiy7BIdpiCPlS?=
 =?us-ascii?Q?Y/jUlnb2khewtC7kJCIp5cXHtV4Arr9BxGNT1qfk7sklaloK/8ImOx+uYWCa?=
 =?us-ascii?Q?5QsN/Kx7UVVVGnaTKM/1oDjWHrMdmnL8j5majJZXn5b8tldjT5NZe/7NnOum?=
 =?us-ascii?Q?jxk2SRUfN3nCSGaZ9TukEjsMEwFqupNekbWuErPe32nnrnX6Qd6ahBc4wMrq?=
 =?us-ascii?Q?PPPudgZQKXh32Y1BlJ6L+bZNZkkyaN1tvwyHbrg/dt2crxPSiYcFVr1c5PpI?=
 =?us-ascii?Q?FQu1Ht/Dy4zA7iHdZb7RWrPRTFCHVCkiPOVTmUn9xZEDHW0WhMCqc+ctSyJ0?=
 =?us-ascii?Q?z9KXlyyUxzru+//jGF1D1QM10bgV78OalSwt+Y5PCZ8W55nTO8cJv2WVNwPn?=
 =?us-ascii?Q?4QQ3ObUvZbXEbpyp13Kx3ZiiVmnq73Zksl5jUzKhEhdcjdkoYYCPh1aH7djh?=
 =?us-ascii?Q?dgBuD/9tFXEaUnWyLCNCg1vQAnjHCCNyJVbULJj8uexaVkEwJeysQHbBJern?=
 =?us-ascii?Q?dFRXJ9DHpyAMF2OymxbP2hnAQftSCe73XND8dziLbKI/Glte96JaRTE3cw9a?=
 =?us-ascii?Q?K8ZQGd8qHGj9S6VgzGhK/LJ2qTTPjpcG3eCaK6Pq8iJ5rOHjy5SQzm8Rg6UH?=
 =?us-ascii?Q?Hv1ecIub+BXWXV36/Ysl7UXxUG8oPkAy1KTLHiDgx2g1dXNlPKj9UoXq+FQ+?=
 =?us-ascii?Q?gyTLNvXCidsUvyVq2+htv8i/x8bulVI615Q4tVbymg0gIhRPDRPKOYGuHFtu?=
 =?us-ascii?Q?rodBqFJsh7GXDomlVlJy4U/qyhrqne7x71aFzTPwtY2FyQbu1p2S3uj8kXBT?=
 =?us-ascii?Q?HopM7W7KCYkpcRQ8FSAQ5UF50WbdAHwWUMVWUCfeoMr3h5mAWFBqgZgbdCG/?=
 =?us-ascii?Q?HMZWpEDdIrWpWUie7cFC4dXspJO2j6ogJu2UGOayNmTaNowlmoI6VSnhpoGG?=
 =?us-ascii?Q?1RRJKD9aivE7xZzeZWdLHMVEyQ1uZFRi2y6NuNiPVhZMMzBJgchmkinNUMQO?=
 =?us-ascii?Q?4JnrwCcr+8heu98oiDn6M99jNgmgKyVOlMhp4DrDRtF1mpXaTdabF8+gxUIM?=
 =?us-ascii?Q?Mc+M79G1ZZGos5CMmYa8AvsrlbL67jz2G2TLv1d+54Ti1TaNNriucQY4x/UO?=
 =?us-ascii?Q?w9yM0egz7dMHlpAdl4feaPGqjYXj17vcPMw3KIjBa5YjfU8T0CcEaIo4sdWW?=
 =?us-ascii?Q?mSW/8VNdu8fovDXCUaDajhfZMh7JM93U/JyhoiHc1vLnoN1V0fdB8FAUdzUo?=
 =?us-ascii?Q?07Sf39WhAcRy1U+4qGUy1FsQJU6FiK0vUbjZxzNDtxjMSFffS0nbSoRbnrv/?=
 =?us-ascii?Q?XWx0UZgjeLUrf29RFXHT1TQUs2xqhMDsJP7PpGR1m1CjTjwJmwRrZmzm8cNu?=
 =?us-ascii?Q?5sMfmaYGv0ugoNtocrDq76NKeLotQGAGqkbGla3qvd1udHoiIOURlhej+gLO?=
 =?us-ascii?Q?BcwFu/w4fNY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JbWX6zcLInm6Fk6Uo3ctpScgmWSO37U11KajkHfSyNKwQ6KkSeRdqelAPFGA?=
 =?us-ascii?Q?e2cyy42bVYygEvLWlkLzJ39E/BQuxa7iuN10SOlxOqsZaLRT++X4SHd6CY4x?=
 =?us-ascii?Q?dX81sDgtks+FsPgjJ1gkPRvqNQMEBID2Unhj9s6fJ8Y6UQEUfNSZCA40gGB4?=
 =?us-ascii?Q?ESucU35dsyWcQqhFrlVrAO9js3VnHQtmmKucMkn2Sti2CEdJrkETqvV7QP/B?=
 =?us-ascii?Q?TwqY5Y1WSXVDrrryB2yUf0BUf407lKReAPQGLbyA59rweG8No9+I8op5DNVF?=
 =?us-ascii?Q?e/PcOf4wFDkKqaJwojXYqms5Dw7zDGC3snUsYlF69mOHcCGkp5ErR84C0cqS?=
 =?us-ascii?Q?XIKysCm02KOxDbuZwI9Z5flB5x3iY2YbvHPnwD8YOk53QH1gRm19Cm80t/4K?=
 =?us-ascii?Q?/BB962Vdp+QixhwWSEy+dY9lVmg0BL1apYV5nwj+BV4F/HT+8WmkL2RasY3a?=
 =?us-ascii?Q?X9XJihAt4mNI0EU5yEctGN9Ivq06sTcfiRp+unOM2jqdUzqhFCdVXz7nEsoL?=
 =?us-ascii?Q?DivWqvsIujD/9wckKhCndnKpnlVDyKtStqCHF9M9bZTbIxsBJWZP874kx9IN?=
 =?us-ascii?Q?7WO1aJmvaFDDyXxsPevDms2DcIf/2r/AygSpvwwkZCCZFsBGGrA+UVs3yrSl?=
 =?us-ascii?Q?HGF9XzkcwjNxz/nnmdGTD1+vV8nlNuuhGVSIIyFUVMDXG3AQlJC3xc0DD8Kb?=
 =?us-ascii?Q?/BCGuYTEbljRVc71FYgDOZvLUlPLPEAgAxYxgnoA0m0Pmw5ckSAvfThpbCK0?=
 =?us-ascii?Q?PjFSNd7NKfhEWXBGbA8n+7KZL9Er8Mbh5URhXRBux+Vyalv35K5fv54WSPLw?=
 =?us-ascii?Q?Y4UGyciRLuk7DfQJ6l2ggcUgH2qAHfirMhYaZOBXzY9SmmZC7onpf/6IJfyD?=
 =?us-ascii?Q?5SOskFFGqsOypN/KWLltT6OurctekVz6X5gsDp7uwumxFuNW3VOZkllBCs7p?=
 =?us-ascii?Q?lhxgpKPOUsh95dNxSeXy1MCClnZ8qs8pu7srhzmhby+xs1zqC2aWZzjqN54P?=
 =?us-ascii?Q?t6QGhmSWR1Pk+W7ic6bGcG7fHAOvNMCfeBzs/gKv8PCCLm0Icq+W+Rokajr9?=
 =?us-ascii?Q?LTfIjzOCR7owM/8D9LoAAmWlJJLa2qRprcwPz8G5dbanEIrmC1TWI1w53ZjS?=
 =?us-ascii?Q?UdE76t5xJMLKJbCmwBg76T5KBIv4ISmpG0dZAwfFlTUJgcs+BjbdwsFdNiKR?=
 =?us-ascii?Q?W6k3ymEJcjnog3BryZUKdXCGC3BKyuZSgMlkTB92n7Jxn48VejvXEZ6941uS?=
 =?us-ascii?Q?3AFrUeGzHayCf0jgkI/3z/8uGapU8m6hPpIFt6wkI5kVgr7qdPyR0QCJgiUV?=
 =?us-ascii?Q?EgLoRHXj4DJL7O4gODfp0V6cpapFeFKEDLtFXV8sToQ+0zAscwK2WfVmmm67?=
 =?us-ascii?Q?6UDhjTkaQDaQVZL+g73KsumQ0mGPQUkrSRwFVkNFd8+CehybDSKqihG7HTWQ?=
 =?us-ascii?Q?yq5WYouOgVCu2MaFwJxDTOOSPTAquDfiXL6A+bd1lDxsvD03rQLhxXq6Uh6G?=
 =?us-ascii?Q?HSmyW2mYN8xJ+1uZXxxhtwmm+DHTMvCZ8a8Y0zVj7u8cm/GoW0OgtZZjbIYL?=
 =?us-ascii?Q?uyIb/1diYOnORh8nwhPHP99pklpmZqR5HK889jAf+gf7WIgSa9ue3qYTshFa?=
 =?us-ascii?Q?mA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qJNALUJV7+3hxCyK6HN2QzcpUOGhgEz1dddUnkYjar2RVcjXHQPawX40xnigRLNWBY5SNs6E0MOuzJiIW9gL2CUEkO9bcES4HwHR1CQnDXQY8egRTKESUY993N4wzv3YzDeA6jBZuwbmroUzN+NiCzm9GEsQmuUTWat36YSXAJvSZ1ZbEhjKbJdELIHbIwF00PHT/ILp9ShIbv5HXBcPUkC55sxjuydMLlv7gotFLJXT6pR7rDKhMyPt+vARqHbjTy+pFg1xi6SDhP2VNN2m7wM9BdBdXEH0INwWfe5o4cY1/XtEbuytobVEg0e4CicrrTaVGg0GipeoeX9g3JeUPm61iGC0pyoQO6LfFfcfl8Une3JTTv6AzlFEazrbkXP6IxxgVwPNUrKVi5GfhBj3OEya/PYZikh4jNju80b1L+lHiPWudGutqb34z4TFrf21kKyYZP2JgrKlkIYRfmjPmepYRrd6vx8ia4XGTHAx9SXNQ40sJUbaO2nUk+ZS6rccKRtfd6XvfawEetrmbCVb8San6UDmOogUCEybP/dINldnTaHrIrqi0MJ9OgLUULNwGLDW3rpUq/L/bvHYnrooVszNjlYMZZtdaGCjYnI8kys=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96f24724-5d4e-4e3b-bc49-08dd81b25c2a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 15:28:40.8823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H3T5z2Ke8Sqx77z51l1+IDgJnaMw+K7fxSFT/YT1x1eZF5o1Mjyzm6ovt+jkbZGdChYaR/FHh79e8IH/6mXmCLiiBP7Soq5bvmx8sDllVX4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6994
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_07,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504220117
X-Proofpoint-GUID: BSmE1w2LWjY7Fc7AVh3j_tdowWDMECOD
X-Proofpoint-ORIG-GUID: BSmE1w2LWjY7Fc7AVh3j_tdowWDMECOD

We are happy to announce the availability of DTrace for Linux 2.0.2!

This new version is based on BPF and other Linux kernel tracing features and
is implemented entirely as a userspace application.  It can be used for tracing
on any Linux kernel that provides BPF based tracing and BTF type data, although
(as mentioned below) improved functionality depends on two (optional) kernel
patches.

The functionality is close to being feature-complete in comparison with the
kernel module based version of DTrace for Linux (version 1.2.1-1). Development
continues in an incremental fashion to make the full feature set of DTrace
available using existing kernel features.

WHERE TO FIND IT?

The new version of DTrace for Linux is available at:

    https://github.com/oracle/dtrace-utils/tree/2.0-branch-dev

The main development branch for DTrace for Linux is at:

    https://github.com/oracle/dtrace-utils/tree/devel

The most recent release tag is 2.0.2.

FEATURES

  - Providers:
      + cpc: CPU Performacne Counter probes
      + dtrace: BEGIN, END, and ERROR probes
      + fbt: Function Boundary Tracing (FBT) probes
             (Using fentry/fexit probes where available)
      + lockstat: Locking realted probes
      + pid: Userspace function boundary tracing and offset-based instruction
             probes
      + proc: Process lifecycle related probes
      + profile: Timer-based profile-* and tick-* probes
      + rawtp: SDT-style probes for kernel tracepoints with access to raw
               (untranslated) tracepoint arguments
      + sched: CPU scheduling probes [partial implementation]
      + sdt: Statically Defined Tracing (SDT) probes for kernel tracepoints
      + sycall: System call entry and exit probes
      + usdt: Userspace Statically Defined Tracing (USDT) probes

      + [NEW] fbt: return probes based on fexit report return value
      + [NEW] usdt: probes can now be discovered after tracing started (if
              wildcards are used in probe specifications or with the -Z option)
      + [NEW] usdt: typed arguments are now supported, incl. translated types
              and argument mapping
      + [NEW] rawfbt: Function BOundary Tracing style provider that always
              uses kprobes - it can be used to trace <func>.<suffix> symbols
              that are generated by compiler optimizations

  - Aggregations:
      + Regular and indexed aggregations
      + Aggregation functions: avg, count, llquantize, lquantize, max, min,
                               quantize, stddev, and sum.
      + Aggregation actions: clear, normalize, normalize, printa

  - Speculative tracing:
      + Functions: speculation, speculate, commit, and discard

  - Variables:
      + Global variables
      + Thread-Local Storage (TLS) variables
      + Clause-local variables
      + Associative arrays for global and TLS variables
      + Full support for NULL-strings
      + Built-in: arg0 - arg9, args[], caller, curcpu, curthread, epid, errno,
        execname, gid, id, pid, ppid, probefunc, probemod, probename,
        probeprov, stackdepth, tid, timestamp, ucaller, uid, uregs[],
        ustackdepth, walltimestamp

  - Actions:
      + exit, freopen, ftruncate, mod, print, printa, printf, raise, setopt,
        stack, sym, system, trace, tracemem, uaddr, umod, ustack, usym

      + [NEW] print: enhanced with argument type info

  - Subroutines:
      + alloca, basename, bcopy, cleanpath, copyin, copyinstr, copyinto,
        copyout, copyoutstr, dirname, d_path [dummy], getmajor, getminor,
        htonl, htonll, htons, index, inet_ntoa, link_ntop, lltostr,
        mutex_owned, mutex_owner, mutex_type_adaptive, mutex_type_spin, ntohl,
        ntohll, ntohs, progenyof, rand, rindex, rw_iswriter, rw_read_held,
        rw_write_held, strchr, strjoin, strlen, strrchr, strstr, strtok, substr

  - Runtime features:
      + Reporting of drop-counters for trace data that could not be recorded
        for the principal buffer, aggregation buffers, and speculation buffers.
      + Pre-generated translator files to support kernels from 5.2 to current.

  - BPF support:
      + Direct compilation of D source code into BPF programs.
      + Efficient use of pre-compiled BPF functions for library functions.
      + A bpflog option to request the BPF verifier log for loaded programs.
      + BPF program linking of dynamically generated code and pre-compiled
        code to facilitate code sharing and code re-use.
      + Improved integrated disassembler for generated BPF code at the clause
        and program level (-S in combination with the new -xdisasm=# option).
      + Improved trace data buffer handling based on memory mapped perf event
        ring-buffers.
      + BTF type data support.

  - Development and debugging:
      + Support to run dtrace under valgrind.
      + Configure script based building is supported.
      + Improved support for building and using DTrace on upstream kernels.

      + [NEW] Installation paths for all components are configurable.
      + [NEW] Header files for USDT (sdt.h, etc) have been moved to avoid
              conflicts with projects that supply files with the same name.

DEPENDENCIES

DTrace for Linux depends on libctf (part of newer binutils) -or-
libdtrace-ctf. While libctf is preferred, building against libdtrace-ctf is
still possible. It can be found at:

    https://github.com/oracle/libdtrace-ctf

DTrace for Linux makes use of BPF library functions that are compiled at 
build time. It depends on BPF support in GCC and binutils to generate the
pre-compiled BPF function library.

DTrace for Linux benefits from 2 optional kernel features that are not commonly
available in Linux kernels:

  - CTF data generation at compile time: this provides important datatype
    information for kernel and kernel module symbols.

  - Module symbol address range data: this adds address range data about any
    built-in modules to allow for consistent ways to refer to probes by module
    and function (or probe) name.

DTrace for Linux can be used for tracing without these patches, albeit with
some limitations.

These additional support features for tracing are available at:

    https://github.com/oracle/dtrace-linux-kernel/tree/v2/6.7

Please consider joining our development list: dtrace at lists.linux.dev
and/or our IRC channel: #linux-dtrace at libera.chat

    Enjoy!

