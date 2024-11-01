Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF28D25634
	for <dtrace@lists.linux.dev>; Fri,  1 Nov 2024 15:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730476647; cv=fail; b=MRQfwBf+1Zab8vkpX7KUjvJalS7Jdfl4uyhPb9+jJcU+r85+s7qWf3Fa10IjUb5r0I7vAVkDNanwTo0YiSFWkXlJCJ7T+rtwTUhi+dzjzVk8VoGF+3T2SMZHKIZKdYaG0YVA2/dR24h+9iiIXerYfv6KnaxfSLf6ylZG7VNXl38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730476647; c=relaxed/simple;
	bh=0XSY9uNMLCAl7Z9D/FIEyhOo87+oWH2E8f8n6Hhzn/Y=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=lDJRNSUrqsFyF/DE/bEsaA0YfmnAv7uT+cKokIkKEG2fNijMnEQASrePxaBpWtvDttep+4Ncw7j1J1Pv3hqHccRJyiGF+291L/5l6y6edEb/ObZrImKB8jA8toZvMLaZ3hm/mV4M3U4oWYu9spKNUrc+6cVIZB+zjPxsVYedVHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VgCSEC+4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hbVH8a6S; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VgCSEC+4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hbVH8a6S"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1Etxls012858
	for <dtrace@lists.linux.dev>; Fri, 1 Nov 2024 15:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=5wPuwPDQO35+BkaJ
	vZMlQvn0gcDmEWrT98Kd5vKbVhY=; b=VgCSEC+4RNifuh1YV/CwVxxAdrhASFub
	WLf4OT1dPUSPoGNGO4gDMxPCb2fQJof5abWMMDaWHnPuYbsYWUhuCtLPlqgukx76
	aXYu/P2/tNCXVgi6cyc3f8yLJ3f5kP/Y3rI2tPSmDNyADZnixIHcuZORaRDp11+t
	HjiE1xwE0oGGsw8OGIa5+lMwPBvdel8q86WI5vBFxEzpKNFoadbSg/ac1uUh4Khs
	QzwHgRXusxNS1zNirAIFdtk8ES5jpu/5cAHZTuXDGIr2TuwiC3xZ78q9wowkXTz5
	j/abbk4nYRVQt9F6lcf4+kp53xYtRR85bar+3N//WAOO/DzMOLK5fQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grc94jkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 01 Nov 2024 15:57:23 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1EtNKU040219
	for <dtrace@lists.linux.dev>; Fri, 1 Nov 2024 15:57:22 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hnat32uv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 01 Nov 2024 15:57:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kUdTZ8Qk/975/BaFuxSgcYXZ1j3XtY/o+RKQeJ3BsKeuLArmplv162gpKWl0Da/MwUl+/G4utDH8yygxkLzszQyOTM9/2Q5Rh1HOcKryzboLnJprCLGA0zqx3ko44jUzb4zxedPeKAa/PA67mdDZ5eAxhhiAE5/liEDbbGUTLis4plD/fxsEZHIsvkuYt+sPSxEEoXak/fXzswCBQSxUh0ECD7y8Wa1tXfpfHmnbK5kHHI0qTllr5C+gC1xSypw5Q4b+DmAOxg4fm5aNkohA630c20rP234gOBv6cXMis91RLW3Cl0L7kHI9MjLoQt3/cvNbb+NBopA8Noky1K4Vww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5wPuwPDQO35+BkaJvZMlQvn0gcDmEWrT98Kd5vKbVhY=;
 b=HHEp/pSepQ/737aL9/zCupOfrAUNMR5R9qfO1lJJJwNbRi54MDcgXZcaXtVEatzZ5NCd7r/vyLhl3iFCEBSlqjV8aA4fH22d2mxJfJNkhcWxmJoZ+mmwwyFFpdTIyMQ9NKP/UYPTqa1PoPjz1YzaqpMAHLvnibVXKFT/My+GgfIcqBxp4OUky31frb15xHe3VCeGjzgnB4KtLtNbh8cWla1KH7eLtlcFGTtjs4ntjpqEDercya2rapOxfLF6AZltN0UiCVprD5xfYRSH0hdiMbeiyW6jo2Dj2aBjQpw97sTvJaZvjQN4jinhEhGd2zX8QGN5Jcgufqpu17bIWkbuCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wPuwPDQO35+BkaJvZMlQvn0gcDmEWrT98Kd5vKbVhY=;
 b=hbVH8a6Snr8/gqnIXjJAKg9pizPXMtB5vc08AQQRfQqzO9WAT4eO8fUmuEYjmCwFWiEPolC7mXahIMBDKeTFW6QKYm8M+Sg385Cf5MOKZx79NPBOnuRijdpOXgEVnxmHI1yQIDFCEiqwLzq006njoyVjXiVnOSWF+ZrJXxFTrWU=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by BY5PR10MB4177.namprd10.prod.outlook.com (2603:10b6:a03:205::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.28; Fri, 1 Nov
 2024 15:57:19 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 15:57:18 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v4 0/5] usdt typed args, translators and arg remapping
Date: Fri,  1 Nov 2024 15:57:07 +0000
Message-ID: <20241101155712.397674-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0295.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::8) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|BY5PR10MB4177:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a3245c8-9769-433b-c057-08dcfa8ddd0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PnTnIhPZ45GncVpHGmp0rTwMfPihun3aoayq0+Dsfkmj44oy6ikor/Rjrpk3?=
 =?us-ascii?Q?bcvBAUOJUmczmheLhq4v8rXiRD130v6elcYnqqHS7XC2w1JJUIij7zzM4bc0?=
 =?us-ascii?Q?/Aif5NqSkEyx1Q3xkBJ3t30pj9x70phOVvALDt0r0zC+taBDojj4iSIw+LSl?=
 =?us-ascii?Q?jttODqhQVnhB9lJmmfoEVqcKjm5QcSTrk30vNGOJrYTz+XzzUKdJPjD3xGuC?=
 =?us-ascii?Q?rCo8fRHF+DM1ghrpWwQvtk7LcQBrVb3p4nbROv92dCeDpTPk0fwNIN7gYwrd?=
 =?us-ascii?Q?pN5F3SrkFCe0U2As3rs1gNvZgCGi80WcGAcwPRyuPd6QDIbb/KY7fR+OGbjo?=
 =?us-ascii?Q?xu+TVL4eamMVTW2AqzRK9MYZXPX5ep8YRlpUIXI6OuUiC5hXiwSe1PLxfJNd?=
 =?us-ascii?Q?VCtF/bu1irUz5eb6OLSWbkrwIuXoYawsZXLZGI7PxeuoVZyqfAKm/WQpszwD?=
 =?us-ascii?Q?LoXWiJOG0kClfNf5ctAIB50WukFFvJLMzN1liMdsrjdBWdw1gVrriVmgqh4q?=
 =?us-ascii?Q?zi/U6JrjnOBZ6Q3h9i8pP6BS0dbikEd5kMZAo5uJSKYVu8dsgAmQhkXxoXTi?=
 =?us-ascii?Q?kl0VtqQEcYwySFX48A/v8o613EIuPTPv/eXI9p6fZX9MaHV95Jdo5isWDfmz?=
 =?us-ascii?Q?6H1+06eJwJrJ1MFlYe5P93G5uYu28HElCYno2zVnJxVTm3IQdIMEZxoijzHz?=
 =?us-ascii?Q?evFWGwqv04MPpp5xA9fDdgPrKY8BxfZO6Qio2MVVRK6MQXi9UM0CVZab+9E5?=
 =?us-ascii?Q?UbU14sZtUJgbx4727wEIqkJH1nOdKj5rmbldZgPUk5tZtBbxoikqEGFW+mua?=
 =?us-ascii?Q?qMDmo34ur+y2HKD3ovglYNzRXbinMV/SSTNc0qEoHS8ylWaIJRBqJZK6O+7t?=
 =?us-ascii?Q?XiuBixl2eWlyJWloLBqMMufYgHcqoniKVk9wfCVAO2J8+H/ON1bwmIvZqa4t?=
 =?us-ascii?Q?xHEku5iXSTxAIl484FJ/HW9Jid9ReHCkVDb4uVJv9cbFdAydgcybguVdGahU?=
 =?us-ascii?Q?Ga4FCw4szjHo0B8BkDZGMClaOomyTPGCE75LBxjmE+9etLOIwz5Rbau+Ue4F?=
 =?us-ascii?Q?3+Mnho+j8rW7R7T6jIPbH2mZGJmNGgBYWQHQGVnHDInVKN4NA4lPb3tZuafu?=
 =?us-ascii?Q?m+j/YAAKjFVMjBwAD5doErDq+8lTIPAF3WkDS0zQn1GiIoj/CEZJHdc9Wu1z?=
 =?us-ascii?Q?GM5hh9sWrYKZcJQpiSsGK5I8PMJ8qG06Jic3XUdINIIFDizTj1hpfGDu2obS?=
 =?us-ascii?Q?WOZVnya9Z95AcGfZ1of2J5zgo9YdUTicp4F5XCPpEunsaRLhGRM4rOEQOnBs?=
 =?us-ascii?Q?2ifF45jNAr2FBHuOeDB4qFz/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LHIJW5RkzS4kdIT/turIb2H/l3fm3JYAg2Q4C8TK3GlO6HP4RkL2YDqY/Bam?=
 =?us-ascii?Q?nd0wJYP49Eoh4gHNkTZaqIrqCK6Xe53O2aZMzLKSALpsVIEmeT3YlqjurMXz?=
 =?us-ascii?Q?xGVh+3swWLk4g/5S9uXqx+FZGNN4Vynb3k2XhLogWK7lJPowkhyuWFDRRItM?=
 =?us-ascii?Q?x3JDIZe/quBuJ5r1ip1xuFqn/o4sD2YxKcUwhxjENsVIZ+b8CLuzGha8SAJ/?=
 =?us-ascii?Q?L+ml5M0rXZUiUDgstgcR33XfxROuNE1tRbNbeyHc1yLU0Jhjnaew/0xlf1dL?=
 =?us-ascii?Q?M603rOV83ctyqofzwPzM/28d3Okqcav3AGnNZuBghdiazA8S8Qn3A5jeLThz?=
 =?us-ascii?Q?aAeu+229HoVv2AFZSuO2QugN3DSmTnEK8nFa0URwr7YdyyffVfnQjPHzgury?=
 =?us-ascii?Q?2QqBN4QtMkCwbzvlPNqzN4FvvPGl+J7QwfeMcHyqcZknowq4Q6Y+lytMEfr1?=
 =?us-ascii?Q?mVSkIZa3FYWaOFEYxr1IqVXZV3u8Egu9nSxBe/jXFLKOocFNnMe1d9FVSori?=
 =?us-ascii?Q?Zvi90BpoTYrNMQdkiWgd/lP//152cqhGYf9absIb18/t7DCZT2jdHNYFe78J?=
 =?us-ascii?Q?NjpK8QANEUOd9Sluq2nOThGPJv3rh9/b1zkEV48eNzT13qdu7ywShLEldLsl?=
 =?us-ascii?Q?oXrS7PJjcQZ7iGIqwtbYp7Cb+6Io9Bgg2hW065/YCb5D1k21nAzeYEaSI6cl?=
 =?us-ascii?Q?bt5TSeTx8bhMPOm4WXNwwzJHqxfxwMeLv3vGWONpRYwyNGCujRkoumXN7/cu?=
 =?us-ascii?Q?na4gwz97EEyBN8Vkzpghygj+MnxK/2fxevTZYNM6/F42DBs+cKA1u9N5IeFH?=
 =?us-ascii?Q?gCRD/SWBjpa5z+HST3ss3CIn3d8TV0rdWmM+GBCu79g6K7/ody4U3EXQIDjl?=
 =?us-ascii?Q?e3qPZjI3z+nHvkkqDObopaXxqD0ur5WD8GeX3VFB/kA04OdmMkb+SHdBRsFw?=
 =?us-ascii?Q?xZg4F7A+8b2avEf/GXLiPBc9DIhK1NLeotlkeM3ZKwQFmsyLIk1gGg0fvI3N?=
 =?us-ascii?Q?bqV4HhtPA0Zf/B5a5qAOpa+ru57WEX03fnSRjcZMUlEhSGrkhpEvNJtiJcF+?=
 =?us-ascii?Q?/sPjMNE4zZGeeA/PKsF6CH745DnidjfDb7/UTIXQKeNSwOgu4vtHn1t0LpMN?=
 =?us-ascii?Q?5FDLmvVxwbVECaZMXTa00njhTs/S/8WhvbSXM7dIV8i0kCoMBKH1U8tCuBJi?=
 =?us-ascii?Q?7Lmd1/b7KTuenZt6hOdQJhj7klu5CoFkbLaaCdJZUQN5cdz1NBiK1lAxFLuY?=
 =?us-ascii?Q?VU54XJpXm3ffU75SbBCtCZ1Z40J2u9F/6CDbKSMNoXDuhuGdf2rZCdU02eim?=
 =?us-ascii?Q?r3kpdi44T+nhAFOt7UVIiFp0sFMfuiq3NDg+9M6bKjJkUP//S/EyKJKDQv3G?=
 =?us-ascii?Q?jU8U5naXjySmGK8oKVS3RTn+JlUMN8so1FEALixGLYh4HtIr3uyrpDy/a7RN?=
 =?us-ascii?Q?ZdZpczW4Iir/FXKSKwesXilqAeexKNTAMpxhKkmGyRwD0t8rytVpZw0rFjq2?=
 =?us-ascii?Q?xinGnUAsRHxNjTWZTtzbn/3pYCAIgi9PCm/Nlto+q/qh+E3N40PMSEyZ4K8X?=
 =?us-ascii?Q?hq6mj43jFcOgJBceNDBzy9+3NLoiha0eqz8dBu3ZRFLIyUqvCQQbe0VXpfIJ?=
 =?us-ascii?Q?HA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4nra3HbiRWzVHd62K6UgpGIezz7RgZWeSLbFV3ic16l06AXyva4pg2YvsITrtO0Gf4KLvqFa1ngu8rKe4iysg7X50+zEouL8I0G1T11unSo6gnqOj4l4BZhOMFUS+W338CHvZidGhc1gu3bjKc+46RkFmXfz/1fLmzunMk2xcJAu/NoplX3O/+jNcL79DY/oJ1Y3tVHt6nAEkJKP0RFPHZ9C1Khjq/AKwXUBV7P7x6Waq2kSLozDiLTIqU9hYMWWNkpqP9D+w2+BhKmRr4GMn0MaO4Z17YM1ivl7Pycq1UKynrVo49VlY2w8dM1YLdo0UbvuMTvsRwx/8o3E7vKUMMCPUQUrFlSqM8QC76mrr8LhJeYbaBMYSWplH3dSpoIE1n/GbG3qoGkyZG70ASP4zs1drW155+eampomM1qvDQRwwPijMp6dt5GC2/P4eoKQTVGdOnQ5KiJCeUOTcIo92/2e6XG/6I7fks29tA0LEXVq5oEMmzB4CDvEKRJSaPy0utzXK+f5ArpfA2LJ/ERyzHaJDcfFcySaw59OTU/baO090oQjZYshABanpqWY0P7fryb2hPAfOS4QwHU2jdSRWCB0j4Vwbpf0/PdcwyVHM/4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a3245c8-9769-433b-c057-08dcfa8ddd0e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 15:57:18.8091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 55k9HyA+TA5D6Heu7A/ia+Z7vnaW/+vcEzpF08gdks6yiC/raGga/HohUIJb2IEsgW33NoAn2ZqdqM1BOPN0AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4177
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-01_10,2024-11-01_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411010115
X-Proofpoint-GUID: rAyJHm_9MwRiztwLkq_nHFf7cn1IqaVl
X-Proofpoint-ORIG-GUID: rAyJHm_9MwRiztwLkq_nHFf7cn1IqaVl

This series adds back support for the probe foo (...) : (...) syntax
in USDT provider definitions.  The dtprobed side is routine, pulling
in the DOF and adding it to a new set of dof_parser.h records fed
through to the DOF stash and ultimately to dt_pid.c and eventually
dt_prov_uprobe.c: the end result is that the DOF for a given probe's
remappings ends up in the dt_uprobe_t in more or less the same form
as it was in the DOF.

After that things get tricky, because we want to remap not only arg[N] but
also argN references (the single existing test for USDT arg remapping
verifies that this works), but the SDT machinery depends on argN being
unremapped!  So we do the remapping in dt_prov_uprobe.c while reshuffling
things into dt_argdesc_t's, and tell the higher layers that no arg remapping
is ever being performed, then do the remapping in the trampoline by
physically reshuffling the arguments.  This seems to work without breaking
SDT on all supported architectures, and is surprisingly simple (at least, it
surprised me: multiple places where I thought I'd need hundreds of lines of
complex code turned out to need only three or four lines).

New tests are added to verify that USDT translators work when types change,
when arg counts change, and when there are no args at all, and that dtrace
-vln produces the right output (all previous tests for USDT -vln, translated
or not, are currently disabled because they all use wildcards: this new one
doesn't).

We also fix a tiny error-path-related bug in usdt encountered in the
course of development.

Changes since v3:
  Rebase against latest dev, adjusting the trampoline: we should now
  handle the overlapping pid and usdt case, though this still being
  verified.
  Eliminate remaining references to 'remapping'.
  Move mis-merged hunk of dt_cg.c changes into the right commit.
  Drop showUSDT arg stuff in favour of Kris's improved version.

Changes since v2:
  Populate dt_argdesc_t's in USDT probe discovery rather than in
  probe_info.

Changes since v1:
  Adapted to review comments (all comments but the stuff around
  trampolines and arg mapping, which I don't understand well
  enough to implement); in particular track xlated args and
  mappings together, and move from a flags word in the
  dof_parser struct's DIT_PROBE record to an arg count

Nick Alcock (5):
  usdt: get arg types and xlations into DTrace from the DOF
  dtprobed: stop skipping zero-tracepoint probes in dof_stash.c
  cg: add argument mapping in the trampoline
  usdt: typed args and arg mapping
  usdt: fix create_underlying error path

 dtprobed/dof_stash.c                          |  21 +--
 dtprobed/dtprobed.c                           |  10 +-
 include/dtrace/pid.h                          |   7 +
 libcommon/dof_parser.c                        | 150 ++++++++++++----
 libcommon/dof_parser.h                        |  64 ++++++-
 libdtrace/dt_cg.c                             |  36 +++-
 libdtrace/dt_cg.h                             |   1 +
 libdtrace/dt_pid.c                            |  60 +++++++
 libdtrace/dt_prov_uprobe.c                    | 161 +++++++++++++++++-
 test/triggers/usdt-tst-argmap-prov.d          |   5 +-
 test/triggers/usdt-tst-argmap.c               |   5 +-
 .../dtrace-util/tst.ListProbesArgsUSDT.r      |  34 ++++
 .../dtrace-util/tst.ListProbesArgsUSDT.r.p    |   2 +
 .../dtrace-util/tst.ListProbesArgsUSDT.sh     |  83 +++++++++
 test/unittest/usdt/err.argmap-null.d          |  41 +++++
 test/unittest/usdt/err.argmap-null.r          |   2 +
 test/unittest/usdt/err.argmap-null.r.p        |   2 +
 test/unittest/usdt/tst.argmap-null.d          |  32 ++++
 test/unittest/usdt/tst.argmap-typed-partial.d |  49 ++++++
 test/unittest/usdt/tst.argmap-typed.d         |  48 ++++++
 test/unittest/usdt/tst.argmap.d               |   5 +-
 21 files changed, 748 insertions(+), 70 deletions(-)
 create mode 100644 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
 create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
 create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
 create mode 100644 test/unittest/usdt/err.argmap-null.d
 create mode 100644 test/unittest/usdt/err.argmap-null.r
 create mode 100755 test/unittest/usdt/err.argmap-null.r.p
 create mode 100644 test/unittest/usdt/tst.argmap-null.d
 create mode 100644 test/unittest/usdt/tst.argmap-typed-partial.d
 create mode 100644 test/unittest/usdt/tst.argmap-typed.d

-- 
2.46.0.278.g36e3a12567

