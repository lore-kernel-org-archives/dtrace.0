Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3805533EB1B
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 06:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776148073; cv=fail; b=VX75SLxd9nrWWfJqkXRfoVqY9ia+vvW7FpLrH9YsF5mATCK52fzZCdQEjEnqGGhVV7qyARTIqJ436mhjb6D/cXqnKCdK7IH6rsajs4pJi674SenxeSNYBd3cmTdKlTpTl5XgPv08GlVP1YWk9l9wAvlDTRTnAdmUXXmgl+zqfr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776148073; c=relaxed/simple;
	bh=iQl/D0ANiR+GXj4sN39QBnW/+NbfF2aR/DDV9Qt1P0s=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=ZBsFSQroE0xfFHJL9xFjiHYL/CQ3x4YILi6hOVzsEDCTXVlcFTZQHHm6lOUbnbbhEn/1lfai1oUYkoqNDJ8tIrPAVtvv3e+s2TcNbebaGA/VOEtgPEy0xwPFz0wfpSRy3PbQKbbBDB7WajkPtSbwA3on8gcR3ce78+tdZZInCS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VdOE7PD8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=y/xwx5cf; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VdOE7PD8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="y/xwx5cf"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E1K4TB1829377
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 06:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=3JHWTnNGYPTeTw2tP8FGiBU7uk+UkDGn3kzUC0/ddh0=; b=
	VdOE7PD85ZB4tfqHY/6c8lXBIlbfoqUDlTJGkbARHYZWMe2Gf7pyh3Oosoh4CPg+
	XPBArWbU/AcGJ5yMpUlklUezvGMYtIBHU/tXBUHckqQEdCBr1ntTWaNOCgtGt10D
	oCTqvHTJF49LpmAQ2ICNs1K1YraFS3jglB2/I95iOi0VZkweugCmhtbzbzUSHxwI
	l1zuUBDFqHog2OZh4nLE9ekIaLfuqH6SVntQYj96WSfwauOAFWpfMdSyXCirBCXC
	vEwkITfdMp/IUcF6hR/RlEdSLK/DIoRmQoPsEWsqfEh2Et9vOCdrKbUgGacJFsxA
	sOyIRbtrpyM2uAIrHePPqA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4dh8680md0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 06:27:50 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 63E6OP1c000817
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 06:27:50 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011005.outbound.protection.outlook.com [52.101.62.5])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4dh9jnrn3w-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 06:27:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XFAsaiG3tkb9HEhcvKX8ApB3szDlflF/KQpHsW2VxAeKHjSwfZMavdt1rOSACECY57rKtzHrGBhdGgvD6pK0c3jgC4A56o/JsUf6MG+fi8HkpdXAtDNSu21jL4AFBax3JfzQs6kkOZaji+bWrbMRatmwlZqzTNJDr8pQ3g+qgFZ4kIdkU/rqb7jCDePA5ZatYHQPZuQfgKXFRROK8ak3upMduwM12u68eb44JXtgv7zS8oq7CJzEwgt03VYhvdRCgzxfetc2wW4oiFwyz8PJhSvbL7i053nJEHztU/hlSsFj6VcPY7AHc0/FDh1zumf0wIn3c2BwL6jdrb6eYauUsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JHWTnNGYPTeTw2tP8FGiBU7uk+UkDGn3kzUC0/ddh0=;
 b=S0YPHGjmTTFIKmsZiNKu0LXFr3xVoL+2ntxpQ5ZORLDWYSXL/2Htxlw1jtPAACjEjaeSOwI0lJpdpIRBHepjr42D6KpKb27CygPewOQMCVDLO1gGtbit1X88/+2eaIC8EraMjFiQP8ss8T/ZvGuES5u1kfanV1sKFDqeYwxgBEqNKe9wPGZhe9UJIiJtmPlY4w/KJou4qe/ioPgXXT9Zb3u8zRm5ftUv8A99uZMLnucagTN4029Pm33S1rGuFbD1cczWd1LU7tUjGdD/vg+F08mFKtfeJOg7BrhyyS6GiENZ2SGHF/GjvZ7AwCkfcBAlCIawFOGaFwLpgs4a0VqN3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JHWTnNGYPTeTw2tP8FGiBU7uk+UkDGn3kzUC0/ddh0=;
 b=y/xwx5cfBOuAlu2/fDw/UwdUt9sw0fS+2RrcJCrgYwxEn/mny5BTypDO/6+//jmr1OLjA4u485P3UiSbLVlx+qK29zjEmH4Ht9YrvH/BfYTxNFFdFsRwXPNw5p4WJvEgW6eyxdh1Jvs5Tta/68RNSkn39JOw1GYAN2xTytxbyDk=
Received: from IA0PR10MB7325.namprd10.prod.outlook.com (2603:10b6:208:407::20)
 by SJ2PR10MB7787.namprd10.prod.outlook.com (2603:10b6:a03:56c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 06:27:46 +0000
Received: from IA0PR10MB7325.namprd10.prod.outlook.com
 ([fe80::edc9:d2ca:45c2:b41a]) by IA0PR10MB7325.namprd10.prod.outlook.com
 ([fe80::edc9:d2ca:45c2:b41a%6]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 06:27:46 +0000
Date: Tue, 14 Apr 2026 02:27:45 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/4] btf: btf argument to dt_btf_get_string() should be const
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:208:36e::18) To IA0PR10MB7325.namprd10.prod.outlook.com
 (2603:10b6:208:407::20)
Message-ID:
 <IA0PR10MB73252238BD3B5AB32F0AB2EBC2252@IA0PR10MB7325.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR10MB7325:EE_|SJ2PR10MB7787:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d2f2a23-da9e-4178-c0df-08de99eef165
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DU+vwZwMajcGG//QJyhlbvTD8uGW34Wo6e/1jW4p798COoqleBKHmNIsqDG14CQ8/WbQLCRiYv8jmj0odTGWIBmga/Kinlkp+sQzM/iwlBjErj/gsGEDEUIT7i5CVkvIuuGMbUH8ps9TSv3LGkUszmVLqFqYedoFdtLOFL6jq/siaqh9qoWmFPEMiwZNp7yDDoNZSNvtEuytjwMorzWDT228MFyfT8SCyd1SmNg33aYtlvIn4pn4euPR6dbTbcv06BZnN5W2gJ+Ha0gDydPXUVyMwMk/NVWCIwGaAeue/VgMCYOunR0cEHhpiBSiUsuK8bKL/FxhtoznwovhjSGBWbiviGOdr9Kgg/QwVKndz5lOxHTANqUv0cV7c78OG/AHyWqV+cP3FachbGbrpCCWOViIAJSw6FIhpNKltLD6kWWTCClEIwSOgpRBklY+b1Ry3UT36VNTcR/n9H2lUSMaWOsaLOEVqSLS9tUAvQ9Pkb7xafHYP8SDmHxPiT3XTnYk8CRx+j0GNR5DkWfTDX0AJo1qwGVoDTo75QP5Zh4rF2+327TLKi6jbtk87UY6PY1kqiSz2wRFDsmJSn/5L6O1DJwRj4ACoxbuHSkGvb5jNjQPjAoYSOKYQ8f859U2SQNu8w9pEYHIs38fP6PrPGdfx12osohcN88A54cHESNkLZPOiQ/V83c5ddV19384mDUla4DfOz0twQBE4rNyBKZ0ADG6XZLO1wu569N810SCWxc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR10MB7325.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tgbpCq+nxwwrc9o/PREKeg+1bhPkXGBFN/H6sunxH3n4/t7/M+fN0tWSymS5?=
 =?us-ascii?Q?ZW3zofqdH6RSJnaElC1JHVh5D6rv4lnIwBhW6PFIJQRw7l7qYK8KJJCG8ymN?=
 =?us-ascii?Q?jFhsknevjfWlW1Nbqi4fV7/FgJTgns4Hs+g10h4MfYfx4j1I3IV25+QDqc5w?=
 =?us-ascii?Q?C8W19it/Me2PtVWRQG2n973Un4mxDHNoV/si8KgfhlBoMyJYHSqkVSOsP8fg?=
 =?us-ascii?Q?mYXuJWILTHYVkNRRq/l7ORLUQfZ1qgiUhLJNU5JLMg29J7Ku43s9SWmcxvzh?=
 =?us-ascii?Q?kYoDFtzgpZ7SjsO616+Tf9OfPybZmTqnmNKP3aYrQCy2hxsGePvbS9tTmRrK?=
 =?us-ascii?Q?3LS0dFNhtOCCgs3/glOYETN/dMavoiEjjIVCWD9UB+QIgFjxpvLs6O1KU3mN?=
 =?us-ascii?Q?7Atv0YzusOGeVbNbZ1lt2SDE4qZyP1Vt3wMI7vFlcEQgWXR6Y9zdtHEcyLkV?=
 =?us-ascii?Q?k8aLIgU7yNG+S+KOxsqg2yYxfhnZWNYU7GoCDq1jEX8iW7ihT52/0+146f5k?=
 =?us-ascii?Q?R8kOwCl5AK8OD93Cq7fpAvQ5Fah/cH/M3T0yL2sE5dPXxXI/sn0o440GdtGf?=
 =?us-ascii?Q?GzhdNY/2rdPeHVH/TCnTcYbiCDnalXrP6F2XGyg7mA16byTWu9hSv8kg2fjw?=
 =?us-ascii?Q?e4qgPS4ke0kN4QeQL8KdbJIsQA0/l6dLR6rW2DRcOr2R+E2iStS77JY8SrlD?=
 =?us-ascii?Q?3FB7Gsa6Np+2lwUkPupoQc2A0tJMmqfn4xJrnK5DOgC4fmLJiPtKHS6fzFrC?=
 =?us-ascii?Q?h4DYOG2f3TNnSFsDFQbxZMWCZFa9eByVunYhBHvsvfO1Mg+hZTtsy5RbEktb?=
 =?us-ascii?Q?awmhWyrbmUO+6cikmGtdr+LObcj8SvhJOu+w62T6hRaq930HBBI+POR6QYyN?=
 =?us-ascii?Q?udn1CV3HTO4o3stbxxTIqrllrcKzGJ0/arnfYsYZ19i/8lAtl8Y/lZkXsekm?=
 =?us-ascii?Q?CDXfkef5fOzTQoV2CCeOawW238fhrYTsIkcSqegt+tU8uvHW9RszTMp8bNo6?=
 =?us-ascii?Q?iJK/7AkTowGpPE9DQab2apVE8Bxa18o6HGjSrUBovmMFiLI+YmgxfyJQrUd5?=
 =?us-ascii?Q?a6Cw+zIw0Lvau0ZgQlPGVVuhtJdBuSWXwxNH+s3UyPpYCJpwkQ69esYecuVw?=
 =?us-ascii?Q?i8zcnpOjiK9Yb4IF4TW2ZweGxOx85Wr4zpKB5TiIfYaV0rWQgUIntDjgLP8I?=
 =?us-ascii?Q?UD5yW3KuF4gvb1h+RwHQfGjcnfvTRZ13BDnoaRYQ4y5XAyu6AeXkzDnNmdnk?=
 =?us-ascii?Q?a1addmgEagnnyYLQ0Sjw71YRYsnX3saAcmNiqw0aVP8dDOCnWOkI1GW7Hi6P?=
 =?us-ascii?Q?nIH1k2x/MHhgJf3NgAlnqupGJbSyrqJpCU827GHPRn5vhtZcQkprpgUbA4iw?=
 =?us-ascii?Q?A9zqxQo98oKkDa6zwehI8wBwtfI7zuZ/n4q9Gd5Kn1obPSJCAFmzUva3GM6O?=
 =?us-ascii?Q?V4i5HmE3ws0XD0GbYYIdhCqNW/ijaxafnu2sLDoj0ggu4t9fly42D9mxGtYl?=
 =?us-ascii?Q?4+jgPFUHthou4nooUo7ZekGbLJjGQg+bOfxntmH+8jdV7EVATE4wB20JxAZr?=
 =?us-ascii?Q?qYgwSaTjHbLGZy/A1REMQVeW5DCZMJvhrgo08QRt3QtJjkcSPoS/2ciWTig+?=
 =?us-ascii?Q?Ojn7G1l3vAe7IKAJTgxWOMr7UBuyWsiIWdSco//kyCLudwqMyR68kVtjMg2Y?=
 =?us-ascii?Q?SEUSPuc2dNAtK85gi3IuB+Qp9H26Aei3mZswmljdcHOGpPnrqov1XOw9LzQj?=
 =?us-ascii?Q?p6q/ybvtBA=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	DgmDuzg5t/dhSvuJJNQxQjnBHUwDHy0cbshBfmzaIGdo7c1qrVAyKNM52Zkcieef7+mwMi3qiGxjDZbrB7TNFgV6+r/60dE4O5H2ZW4ZLNYIL+/bzzvlyHqDq2B0emHjQe8uIc4Q6Z/qGa32uuxH9RpJu1o+kGz/3JVmualeiLjULz+fm6cA2T2WVVSy0naJNPM1ym6RhgFXZZxR7Qkqbgagrcmo3WkHnOmTXKaYE+43nRvWJzmdjqlQ238HOqDceuP6B/d1ulfXHPF+UrcwDNmyhh5h6iYTkqpoANHfqE5r/7pweSjR52gtYTekP4tx+tVzIVAuSUruUyEfhnOZAQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kBCS9zrubDOhZ9pmJubJU0KElUr4evDOBC1SyvfTTtaVhzw39Q60tKe8X1LQry9P44QMB3R4C34uy/byUmIbU1abVA44T8t8XvjOHzXYwVMe0/vGLiPjSorAyUTB5HfYqSS52CUYHVHzDRDyBxndr5+7wvMX5b/lDG5ohuSpJWEdRmbjMkTLHq+2yD99DJrXuRMNVa8rUNT5e1Tu0yK3Xy8/Muqdwepv5UXh1ahVbIuVIT/PQ471QKyeUchARc/ZzorHHbAIq3cn9y8kSZuq1Hbfp/bXE7Clqxv2VfXrpuR/9pOUl24fA/tCWCdcsoapZVDTi3vboy/lBfjSCADJIH9HdvF4oWOPe94biCdppRAo2Q/5JZQSCN0wXIYDTT1EXz5nbQT36nWpb3/gdWFKtXT13hXcVNqcN87MZL7759Wvf2+NW8YIFkbROAICcdmeZjmf3EjMPVYAvyuZ6KQBD9JTsXybQZZHXcznR/ZW8SqANMiNCPBd/zD1+GSd7rCry7+G/LM8eqKqOTE/w8c2X4LzC+o+QpoIF8cq502hyysXz2VNl8q3fZa/s0dGijGvVPm138mgZ6vq5X2Dd2ubXjnIfUWxLq6SNJfAMjDEe+Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d2f2a23-da9e-4178-c0df-08de99eef165
X-MS-Exchange-CrossTenant-AuthSource: IA0PR10MB7325.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 06:27:46.5928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6EqqwVAGzbDIFwBXs4wNaR5rxiWlvMoK+WweDh6t68l2tUtGH6rb5xnSbr4ZYEjwPX9Eyu/j0P3QMNf7pJXTTgDvNelkpQ1upXhNn/o+4Ik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7787
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=891 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2604070000 definitions=main-2604140058
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA1OCBTYWx0ZWRfX1DSt9DvYtAao
 VNOICfyrPZI4aG9xhgFd+Lr8WkV7dmcl6hOly2Nj1FU0aIUQTaBVvjaseAUNX3zP0+X47bjS941
 5aTKsMxQElTMNaUDsOQVLNqZqg8GhIju6LHL56dpP4m2dSGiwsx3MMQ9pLbabAzcfc6eVHS2+jZ
 Xwwxs1fjNvdoBHSbj9cHRjDGLkWXv1b95SaQ/zzShPWXfXE8vRWHzcwKU+/dVNf+QZPhHjHTBik
 yVGgtgvOVugNmlgwjMx/oyGXAC9IPqtwZHYZ3IE9ipl9Z0t8qHL2s5jqH1BCcNMPv9S8XR8rZE7
 wQr5SDqfr4MED6Dwq5MVVIhPgXGkE7U/4f7ONa4Gwh4d1RK6oVy7zdgMrRirz/JDmBTn7UH+VdJ
 u1b8LuNNtmrqeDREpD7U0CdvWApUZWtgKJEOeYWyaFB8eSuswR97lu0iZqo7iYlLkkgSSe0u6db
 EJNXiQXWC5Yc7mKHfGA==
X-Proofpoint-GUID: ES2dAdPg1-pO5mwhcw9d97YcJqW72ijA
X-Proofpoint-ORIG-GUID: ES2dAdPg1-pO5mwhcw9d97YcJqW72ijA
X-Authority-Analysis: v=2.4 cv=JY6Ma0KV c=1 sm=1 tr=0 ts=69ddde67 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=3I1J8UUJPc9JN9BFgKH3:22 a=yPCof4ZbAAAA:8 a=tJNZnr1e0lVOoVyamWEA:9

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_btf.c | 2 +-
 libdtrace/dt_btf.h | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
index 1f6dfd54d..d08599192 100644
--- a/libdtrace/dt_btf.c
+++ b/libdtrace/dt_btf.c
@@ -849,7 +849,7 @@ dt_btf_type_by_id(dtrace_hdl_t *dtp, const dt_btf_t *btf, int32_t id)
 }
 
 const char *
-dt_btf_get_string(dtrace_hdl_t *dtp, dt_btf_t *btf, uint32_t off)
+dt_btf_get_string(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t off)
 {
 	if (dtp->dt_shared_btf == NULL)
 		goto ok;
diff --git a/libdtrace/dt_btf.h b/libdtrace/dt_btf.h
index 3e5f53622..d956ad940 100644
--- a/libdtrace/dt_btf.h
+++ b/libdtrace/dt_btf.h
@@ -20,7 +20,8 @@ typedef struct bpf_btf_info	btf_info_t;
 extern void dt_btf_destroy(dtrace_hdl_t *, dt_btf_t *);
 extern dt_btf_t *dt_btf_load_module(dtrace_hdl_t *, dt_module_t *);
 extern ctf_dict_t *dt_btf_module_ctf(dtrace_hdl_t *, dt_module_t *);
-extern const char *dt_btf_get_string(dtrace_hdl_t *, dt_btf_t *, uint32_t);
+extern const char *dt_btf_get_string(dtrace_hdl_t *, const dt_btf_t *,
+				     uint32_t);
 extern int32_t dt_btf_lookup_name_kind(dtrace_hdl_t *, dt_module_t *,
 				       const char *, uint32_t);
 extern int dt_btf_func_argc(dtrace_hdl_t *dtp, const dt_btf_t *btf,
-- 
2.53.0

