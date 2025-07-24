Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362BE1F462D
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 07:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753340909; cv=fail; b=W6lwHEW9fIV9Wbv4YHMK6KfN9ROHSlSVwo/7EsigEVDTZHvF8q1wEaLRIvCH5BVQiyL3a19SltdN3rAoysvnQwrmOU/DAQBpoMnxj97mpdjwTit8fwTjCv9RnGzFjncvVqpg5DSjdyh43demLyoeEfgZDza54v5yXBIMXJg8i6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753340909; c=relaxed/simple;
	bh=NKwdXW9M03AzJbCN3fvIkJQY7AHvnMdg2/Tsdnf9NSY=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=YYBQJS2w9dRbu+Fnww0A0aPsi8WvHjKyrgeEBA7to/x2eAz6ccj/kkHWEPpEhwoukBt0zTnvt0MyOjM8GPvq6RT3TkwZ9TcepksWuIu0c+E+uTUx4QbsSWZa7N1n2Egn/Ez0wi79GfkhA92D7lIpTRxqvfaqCr1X0D8no+KDPQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gxLK6nB6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=EXUWkgRq; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gxLK6nB6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="EXUWkgRq"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O6uJjJ002942
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 07:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-id:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=corp-2025-04-25; bh=wtuaJ
	I3LlrDYFptP6PktWX3U220SzedeoUKXtOe22Sc=; b=gxLK6nB6PFbwc3O4Lroy4
	QUSDkcKFYJVgyU4DzpVY4d7ndJy4xoG/WfpdBlu52BQVk6OFka/sUXYBry6L8iXu
	P8ZB2kEDL/5VGuSnPgHh9Kr3Ghs+W5KSwuQlaIdSsx90NCvOWlEmHTfZFNLYL0Id
	THNE9g15Rne5p9ILxUUCsEhbmdVKnpDPfE4vlPy0Ox4MzihYy7nsc4VWxHlfjMcw
	iXUtAUXBPzXkTLSgN/E6yo5KFK2aT3xBp/TJzrU18RWzMJhrhT46bKt8LDZR7QlF
	EtUqIz5UwImIq/pi6/RghdKjIc66Cx6g01eXtGI8/83MSb2KOGxsLaP0OVp9cmpq
	w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48057r14vc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 07:08:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56O4qGTC014611
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 07:08:25 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013038.outbound.protection.outlook.com [40.93.201.38])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4801thuaqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 07:08:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MqWcjEjGMFWh2JKzSpBriRDAbKRr2T9oaIFXBy/vu3odMb54Ldmy5AL+8gJ4erdIvjvt12Gvu4KMdThDlySc1pRTW/5260NBi4Y7SInsIoFGR4CnE9mFjTTx8yrKXJErpgS5HXCza+EVUlhSE0JjnQ0xm+Enrjo7y21JRA8UrWLx+8WWAKG9CHzJMzP1diblJVwXMhUipWMAWefr06Iy6VfuZVvnkXSUJiIpXVtXeleJL1eBb29EFP+KPr3t27IqB6G15fSo7eo7Gaql+tsCJ4MZYt1RYaQ8ciYZIalEQm8zHMHJMFeL46GdJQUcO7XNdwaml5gHQ1AU3Ex+uPHDYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wtuaJI3LlrDYFptP6PktWX3U220SzedeoUKXtOe22Sc=;
 b=XqsBlSocEjsFFnpTEmRjb1Ns20Yf4/L0ZUAS2+ZhuK2+sQNd7zb8HBeRMvZPdMpUjLfauaJCNJeON2RRuxb4WdsZgiWBS2YNIwNFYKO5uSNM/GdY+Js1DP+AZZsuToLeVBK//iyVYUkLAXYuMb+EKR+AyepQ7eYeM3wXdZGmGnWvVdddOYq1J7udszPnJNfMcZ649Qamkpzl+WxEqV1MDoAvFbxBQ6KdASraBWRIZKETmBYFe1M9Uc2NHZ3fegrzDjkO7rGRlBB+3q19dFP6dMNFdyFccOeau5jriQPzNFWXS/EzhrdTyqm/pn692qryzdKkmVnYY+MIPlHN5A6BQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wtuaJI3LlrDYFptP6PktWX3U220SzedeoUKXtOe22Sc=;
 b=EXUWkgRq2/LcjQsNqnSl/cOe819llGVpP6IsBkE7FgHc2apqYnJGN87eAh+Z8fpsJiCIw5u3AKo8TEHRb5HS285sG93KFicw9KRRvMELSR8ATkUOKMnSAabQIbCIWyAMgR4yYd4lpn0/RQzLiGUdbV7KGZhkWiqx17dUEUROVT0=
Received: from IA0PR10MB7327.namprd10.prod.outlook.com (2603:10b6:208:40e::22)
 by SA2PR10MB4731.namprd10.prod.outlook.com (2603:10b6:806:11e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 07:08:07 +0000
Received: from IA0PR10MB7327.namprd10.prod.outlook.com
 ([fe80::f6c5:2814:c5cc:b398]) by IA0PR10MB7327.namprd10.prod.outlook.com
 ([fe80::f6c5:2814:c5cc:b398%6]) with mapi id 15.20.8964.019; Thu, 24 Jul 2025
 07:08:06 +0000
From: Ruud van der Pas <ruud.vanderpas@oracle.com>
To: "dtrace@lists.linux.dev" <dtrace@lists.linux.dev>
Subject: [Patch] Example to list and count function calls
Thread-Topic: [Patch] Example to list and count function calls
Thread-Index: AQHb/Gm05SV4F+GG2UKd5+G2SZcSQg==
Date: Thu, 24 Jul 2025 07:08:06 +0000
Message-ID: <442200D2-1F6E-4DC1-9D24-7B7E2FF2683C@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR10MB7327:EE_|SA2PR10MB4731:EE_
x-ms-office365-filtering-correlation-id: 7f495856-56d8-4933-6bd6-08ddca80d709
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?En7TzyKlm9/rs8cvUs7d5xiUaFMd0VVtx7OlY1TAcq1QwxyPA/uqQ10ys/Wd?=
 =?us-ascii?Q?5fvfpMkAXN3LRfNY2vfMp72OFS7x3OwTyZ0OdbqgMs0eISkDOsQ6m4ga5/+H?=
 =?us-ascii?Q?wWLxgHd0SKszRljfjHM7iltqTzT2wBztTmwxwib7M/SjsR9aGtkQrEF9fWAW?=
 =?us-ascii?Q?B+htAAl6K+8ypHIENkstQXQUBl6jdUDLoczYzCqvUusH5FLoPq9eQYszv4D5?=
 =?us-ascii?Q?Bwm7buhTZJR1XlLZwnSWe6/J8BCqKirK/ljrvcNoAXLB4Tx60zkkJoug8CRv?=
 =?us-ascii?Q?6IUHOK9KjdhyyQCDdVwFjkfeBQ+YjrgjnUsGN662aBUEOx62bxIABuXp7ovG?=
 =?us-ascii?Q?0dtkLoNlXPU/I3K4E4sm8fSH/d7DY0d36h0yuqEiEkjwzOJPFqDM6ss9GEmj?=
 =?us-ascii?Q?OoAivxEBnTf7xsHdkzzxWa1FAei95l3EzejZVlA2XHm/sEnHltW3IrIR7ICh?=
 =?us-ascii?Q?mDYpiFccJafDF3YUgx5S4jGQ7MzUdVyTftgNngJaZ8IjRtC18/ArmtM/B+6J?=
 =?us-ascii?Q?Gsu+U7lVObzkbCpFcz+0tpusMQeKU+RpNkRm3cB/WXZUv5/Sc+WIN7dCHdQu?=
 =?us-ascii?Q?H3i2zPlm10DwSksUDaamxr/lhjuHPjES7MpZP01mow7tlHoR1JWXotFoPuUZ?=
 =?us-ascii?Q?clv6z9p8GzxIxRj2DLXNMOBt/xezG9f90iA07I22buTP93mDG0vIdJC/NXzw?=
 =?us-ascii?Q?u48ESji7sMVtH6B9ANirpXBQ8ljQ9wcwEochG1SqOgusOQwjbQNkpKojz2RE?=
 =?us-ascii?Q?MCcm8tvgXVsbmhIFWOEgIrR0fJYIv3M9RGjTX9amqFsR6L81YMNkqOUbPZWY?=
 =?us-ascii?Q?213PTmMbocbSBFfL2OBkuN2geLkUSKuEkpk8pm8PQDMKYn05xjw6jfvwQckh?=
 =?us-ascii?Q?X25nB6+txPDucU2qxp6n9jDxohi32NbNcK6S79bd8PVh4Eb6L9CEQ2fpM3bf?=
 =?us-ascii?Q?STkq4SoFOFbHUdLCXGYjyeVi+c+AkPxF2Kn5Fsfr5VJ2MIxZFzFEqRPv3YY6?=
 =?us-ascii?Q?LnNWCCWp+HAD2TmYsJDQaJYaB1aQGgpyEE+uj7j0VuCu7wRfnkuhxlEj6raG?=
 =?us-ascii?Q?KfFszF6JJjhrz0ikI3OLDa58Aa7jr+RKpxaX5xx4Tj+hhgVxkjdNxE/xiFgp?=
 =?us-ascii?Q?sPMMz84hZdWkJh2mmT/OcKVNQlOempYWrHk3TN/+wI2NlPv1EiMyHBSkJbex?=
 =?us-ascii?Q?dWhGpjRAsW7LOAFksflTJDAR2AdygXXwAAd1ABKSowelmc+NJ4c+QqudPiGL?=
 =?us-ascii?Q?CS/KIt7mdDO5V9y7L1+jhQy9/exjvVBZjv/9XtrQ/cphdfHkZ7WjYWA6YvbO?=
 =?us-ascii?Q?4cAkuvH63D1gKjcsCExA0W7mXnyVDwt41jv7pmmywI3D5NtDl7jIgt1uHA8o?=
 =?us-ascii?Q?T5wo6UHP5pOeno1Jq2XUST7RnpCkydyqEuJAELuiDunKAY5w3UY3m+YLyjj7?=
 =?us-ascii?Q?FfYhrc/3BwrNTKEWER2Y+LB5QbRpQsRZBn1UZqTuALT4gDiE9PHO0w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR10MB7327.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?J3Q3K3TDLFxHzgjB5ErBLLPhB6snQx9SYo/3z6c4TFepfDbd85hAZL3AI09A?=
 =?us-ascii?Q?6VSfghdCq9wVHL4UN8eoychboFoE4QPjbfv/Z2axqcfV/Z8ODUiuMKrJWH63?=
 =?us-ascii?Q?Kj3wuY7n6+3HYZJTo/eWZ8kALqtHHaV7Sy4t2NyVeftSDcWYaZ6mfu0akzVB?=
 =?us-ascii?Q?X0+MSYdHjHxF0XyPJFh4RAeDWB+1boeW6E1FQkBVtzQz9aGdSCUCJ3g7S3v1?=
 =?us-ascii?Q?hAmEbG1nQobnO/yw/J7nTSO4FQ/i+QduJY4yf5Tt395KaxyrqbcvKdJ6a0pq?=
 =?us-ascii?Q?l6ZugiLzL2b0Tu6hUhmO08m67AFhqehj106ho6PEBOAPt+fCXd47EJRmkuZp?=
 =?us-ascii?Q?gvGTedv1/tkk5uWvr78s3A1lVCqQuGPnaT0l5Da9JXs8SxTVfFu0z1jlZYsi?=
 =?us-ascii?Q?qmRzN3fHe1SY25i5WXxEEoTctnHUf42Fo81OXYCq90bgKLghNtEiX/U3+jI/?=
 =?us-ascii?Q?fA7PSHPg0Qgv18TEJ9SGnsnLUPWCAqAOv8iRfHBCou2diQ8f0CgMfWbOS+8w?=
 =?us-ascii?Q?ZdY2x4fCP9e36EPMeEJ1Ai4J5kZe2S1yaOG5MKoWJhiKxWmudHXWLBTZF6xZ?=
 =?us-ascii?Q?YZWg1/N/EqzGn3+porDRgmQ5r1wEBuK7WHRk1MnOhxB2C0SX/UvfJSr6/4CH?=
 =?us-ascii?Q?XDUiQ9Yl9EFrsz215NPoLMV/zAxD7YnAj1LCkx/Gwn+MtBKwLiKSTd0sjbRQ?=
 =?us-ascii?Q?ZLt4TzW4kHLn82OtCnKzDqc3gsmeCtLAVdyxXv03yWK09eyGjdNk8vJBwlc+?=
 =?us-ascii?Q?MXypEM4hgvXi+OJfvQLIE/cxqMhy+oTKBXmNfO+LvYFGHGy+T+1cqO0stzJ1?=
 =?us-ascii?Q?Ary2BSVFN1SP17osj9CZfbP9E8f0HJXHxdae9nilEG0hX3jaM+ptTAzQmyc0?=
 =?us-ascii?Q?Mw9U20aaUR4uslzsOpDDfyWoBDGBT65gfuUJ55nwgOJQgR1Q+M0WctPbG3XL?=
 =?us-ascii?Q?NHzGf6suN5eBHM37txZ/M8jvpGt6ouqiZ6uphKwBWXI0kjAghnRtFhUYSqY4?=
 =?us-ascii?Q?eVYbGrqc1QWeh+3NiwPYBC0MtVtqPR92u1n10VEn5pphyytRB+bxGfHrVehF?=
 =?us-ascii?Q?/SNmv/SdY0G7/mgh5mvl6wU45NbxIp8D12iAuMJrbgzYEVKb7ElOAwKqQ5Bj?=
 =?us-ascii?Q?RnbyvMT8wVRSJStf4wxx42fXh1iD9tiEgrdFABp9rkLiTZBM2FUzZv5bXN52?=
 =?us-ascii?Q?4oKBEUlasG6oRwPwzeKPHrgFVMXGfw0lMcF2orKrapsb550g5ONi/gi0QzEf?=
 =?us-ascii?Q?RXzvkhmpfmXsdhvOncNLOgtadu/mN8q1526RY9GrVkP6orNkFKrPC+pzXd+H?=
 =?us-ascii?Q?ob1ubKnXcKSBTQj66CDJtfXq7HNU/hTYn4v/OSmhcp73t0apGA5GzOg/auHC?=
 =?us-ascii?Q?1MWnQcF6FNhOj/0AJqL7R8XXT0nqaI5KxQZVA7VOwZpp96ho4lMz/Vs2mq3C?=
 =?us-ascii?Q?CpCBKmFxZMAv2bDHVveFDiVkm6IENp/OxqSLSbdfQG/ps92OX7rIkieiUdtI?=
 =?us-ascii?Q?/T5idnsxMPTE08rr/JfyZYxPX1E/QmjPNE09udvJy9IfDB4pjQBKhls/kw7o?=
 =?us-ascii?Q?fWu8heUQu2Ip2ke2FubTWra8X0oYgptLq8nkC9NhgjRBbEHbRryy5d3EJSe9?=
 =?us-ascii?Q?ZUhnYmBvS3E4PHcAgNSW5o+Tu63qTysMVyvGk17GCtevS/7dBTgIY0QNWxZp?=
 =?us-ascii?Q?OStfGa8/pJ22j5qeIWfE7K9iffQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E2F9957FF5C9EB4CBE46EF2F7C50392D@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	U2XrvbEWYZar7O9neue6n7bWIdDCWR435McNYXQ3QeLBBBv5KaIVplG9sLrHwdP+3mE38LV0ihEmtNkEK2eDvSsotvKCEUb/8gRCxIhppVbQ4zF22lbaJ1N+OMsV4T5DLLitkE+dLmOO60Pya2kK7WudNUvc8nXI2uytFqRTq8JgqcYiCx3Hq4aDAUFA1x8KpNtc+BopZ+uvdzPJUkWb7LSnYQpa7M9wWz06N0cuvEiB7D1JE14Hd7S4AyAryqbgdF1vLXEnl6nFJAG06tduSW5msjgRNgoWjD40L1r3qJ6WRlzZo5kZSRazFZ8E492h8rhnetwih2IX6V0M7G/IqnXt4MRnJevnmfpvsdlPEH66aJO9slRlIYablYZTtiH9l0j2G/YvRgLilPGwV5byhap+4yzoUSt7kDF+tDBaBFbIZnM+OjKgYX1A40aVMNmGkL251Wuwks/rswj3Zq8izjL+qc2s8tvVfuJcEDDsBMeEbZEUPnSy6VaUzNYcpdm+kF7LhN/nDbYgON2yAkC8cehO8ljgLMp16M7/4u6Kt9+7fsC8zU3In74M1uDGzOtuh1zHO1MCmuzFvn8DWqHFrGoSBaN2puOgwVVoZZCq0qc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR10MB7327.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f495856-56d8-4933-6bd6-08ddca80d709
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2025 07:08:06.8399
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qCXrp2K/3/KgBG/F3PilnTONDNmW050JxvLhYHurYeb3si+oaPjeYPbFywLP3iHpQH2Bzwijy7xB+Qk7S2MCUXiNnAQ5GtvC1o56HNnl0EA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4731
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507240049
X-Authority-Analysis: v=2.4 cv=MNRgmNZl c=1 sm=1 tr=0 ts=6881dbe9 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=DaxbEbIdeamXgDcxqw8A:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12061
X-Proofpoint-ORIG-GUID: nmKY5ckUTo3Nmk5AQ82RSa3s6wEPzvIH
X-Proofpoint-GUID: nmKY5ckUTo3Nmk5AQ82RSa3s6wEPzvIH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA0OSBTYWx0ZWRfX1a2jIan/ol7Z
 OEP4DS0t40YA4oqs0vZraFWrwHtquXdkHxZ0czTvojAGYiFPtuzQgz6Ou4KuO0DBdHG+0ch58cv
 N7WakPtpF5tnDDcixKvoRE/sLpNMvtaOrChYh4YN1+ndhNbaetL7FPjOxl2ytklIc8m2LOp3wXL
 n+lUc0rfP0N8s5YJVvv/mra496SMrCQI+pkDi7BHSeFhi1JD3Jvc5LsGGv/Z4hcyuc97Ntt0nns
 aOAgmKsp7wxf93aoREsAX3KbrJvc/miIBeDkMxRjEiljowlkQ0AZNyVXYEEpLv6Egw5xtXLe3UU
 INH+DXPf6N+aHClRMfj6jpAvyS9MCVjtuHDAyOx6AwCjr2TlG1/x1Qql9cLKF2tyeUEiR71itlO
 mlfLx3Y7rmvcZsiuYw3OSq/6sfYt3xmioBQdu2ktjQK227kU7yyoZ7ClzuisLkTNPxdt6g1R

This example program is called fcalls.d. It lists and gives call counts
for the functions that are executed when running the target program.
This information is shown for the individual threads, as well as
aggregated over the threads.

Ruud

#!/usr/sbin/dtrace -s

/*
*  NAME
*    fcalls.d - list the functions executed by an application
*
*  SYNOPSIS
*    sudo ./fcalls.d -c "<name-of-application> [app options]"
*
*  DESCRIPTION
*    This program lists the functions executed by the target
*    application.  In addition to this, the number of calls to
*    each function is printed.  This information is given on a
*    per-thread basis, as well as aggregated over all threads.
*
*  NOTES
*    - Since a.out is used in the probe definitions, library calls
*    are excluded.  If a library like libc should be included,
*    duplicate the probe definitions and in the copied lines
*    replace a.out by libc.so.
*    For example:
*    pid$target:a.out::entry,pid$target:libc.so::entry
*      { ... }
*    - It is assumed that a function called main is executed.
*    If this is not the case, this is not a critical error.
*    The first probe is used to capture the name of the executable,
*    but this is not critical.  The probe and printf statement
*    can safely be removed, or replaced by a suitable alternative.
*/

/*
*  Suppress the default output from the dtrace command and
*  have printa() print the data sorted by the first field.
*/
#pragma D option quiet
#pragma D option aggsortkey=3D1
#pragma D option aggsortkeypos=3D0

/*
*  Store the name of the target application.  The probe
*  is restricted to main only, because the exec name needs
*  to be captured only once.
*/
pid$target:a.out:main:entry
{
 executable_name =3D execname;
}
/*
*  Use 4 aggregations to store the total number of function
*  calls, the counts per function and per thread, both
*  seperately and differentiated by thread and function.
*/
pid$target:a.out::entry
{
 @total_call_counts                          =3D count();
 @call_counts_per_function[probefunc]        =3D count();
 @call_counts_per_thr[tid]                   =3D count();
 @counts_per_thr_and_function[tid,probefunc] =3D count();
}
/*
*  Print the results.  Use format strings to create a
*  table lay-out.
*/
END {
 printf("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");
 printf("      Function Call Count Statistics\n");
 printf("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");
 printf("Name of the executable: %s\n" ,executable_name);
 printa("Total function calls  : %@d\n",@total_call_counts);

 printf("\n=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");
 printf("      Aggregated Function Call Counts\n");
 printf("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");
 printf("%-25s %12s\n\n","Function name","Count");
 printa("%-25s %@12d\n",@call_counts_per_function);

 printf("\n=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");
 printf("      Function Call Counts Per Thread\n");
 printf("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");
 printf("%-7s %12s\n\n", "TID","Count");
 printa("%-7d %@12d\n",@call_counts_per_thr);

 printf("\n=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");
 printf("      Thread Level Function Call Counts\n");
 printf("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");
 printf("%-7s  %-25s %8s\n\n","TID","Function name","Count");
 printa("%-7d  %-25s %@8d\n",@counts_per_thr_and_function);
}
