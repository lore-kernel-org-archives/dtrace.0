Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5C81D2796
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730150296; cv=fail; b=eWLT9KehLu3nMhDX/Vl06QlevP1UNYfbuwu7FKw0D1tm0qer4z11SFtLygvYF/8putEIeDT1alnipszD8vRYntM8gL0+0Af3swdCdTgrbymb1W8fxHyCfDS8psxcw8Fq2I64Ay35DdRfhw60Hs9EgVNOl07QM1vy5ObxK7tFi4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730150296; c=relaxed/simple;
	bh=ZV9ArBQ95fjn+lzdCCP93rIFPTighjbY8LvRUG6tn+8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=C4wNMtm0V9GK+CeHr2X/uNYqJZy9ZNQn5qeBzwuM+CnVwMJlrMQ9wndT3hAvqEE33PcQvO+SngRYvh6ZKGb8fPqtwsBBMwu/quzlDuZZvV9WWNCIg/ARuNP6cCSXpUme5C4fxaSpk8uGxaRsRkBcc8y/iXw+3r+tsh+xfDi6KFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hq7FIj04; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=q+kj6b4u; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hq7FIj04";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="q+kj6b4u"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKtae2032545;
	Mon, 28 Oct 2024 21:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=voSDuNs+RO3ZSlG5
	7+puSS1RDIX13UqGwXRw9l7O8Zg=; b=hq7FIj04oJ+BCfu6EMVL1rmM9+W4iCVs
	7rBQ1ydF6QuAIRuKpwYI1WQ6gRmvdtzqIfwTPzttbfkFxihcSfj0fkNpSjSZLBUN
	Zy+jE0+ljbiyX6/SHXoeubQm8LbiplaSkkJ04GEZngZlnuBvg5STtFCLihXjXk3h
	9+7PBm8mI6gzxisth/qQQmQ1aoVcvzBgokfioPHbiZH9eg+5zKUzxSSe4cpklImp
	uMVwJy4HM/ksyMCdp8RATtW8lwYhlUCblMBaDIyuiVkbbCDlU9NAHHIpBMeCiqBL
	RK7yjhNJvdPUmRKH7dkK4y5hbh2q5r0O0RIs1+U1ZRkEe9W/zCu4sw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grc1uy5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 21:18:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKABMb040236;
	Mon, 28 Oct 2024 21:18:10 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hnan35xq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 21:18:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mw4MEucckST5/0ickw7F2rp/DDpbK7l//rgaJyioxeCjxgHFEUl87ljAMrOhChejAABuhautLC8GiKnFIAsF1i4249mn1+0xIftvBZBrBmtISXj6VQER9Mh775RRFWpNQFNvILZ01AgALS6CTHuHvDs9PxvFKVXazE6VDcseXSAeH7soUvkiICDVO2HAeOCCwQrreEWxjOn+SmwHcFIPur5ganM+TgwcTx9owONfjQFCmRGd/YBeZV9Rf8fK+Mvn9/aszy0CifG+dFiLngwrk4XafuBrSqFa2vy26SP82FHWjuYguy1uKdwx6ZZ1pdVipmHyaUWHUfcMriZRAPEj/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=voSDuNs+RO3ZSlG57+puSS1RDIX13UqGwXRw9l7O8Zg=;
 b=IiomSubDwY8uxbl8PMe9HRs+Jl52xqF8Wnt2sEbtaFuT8sJ7segJ8c42sVMWG19ib4AQxSp9pQzl3L6OffpnIDjOD47Y3ArxQOtx2SYgZcWBXLaPodw4c82t8eyh2EXEckwXhGXwelsDYmKku+rf5cEFd4OB3Z9YSQTDSFNmXcU4u5wHwKbYoAik9awo3z1eEN0hahFqP4rcZK8n9cL1IzmwiVIb/qBNW1cz35XqeCElrOaQG32c9ZJ+ryn3NUIzgMJP13MSmw6FnMyy//U2R96Y8NJKue638MKgX7sKQxH8nc47jVklgOL6YQFRn4vXl/4tXbBka4+UUu4C7IAMdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=voSDuNs+RO3ZSlG57+puSS1RDIX13UqGwXRw9l7O8Zg=;
 b=q+kj6b4uOCakpvh+HcwORiEUP0B0MwSjWVzMW6EvuqD13CczrKYjoOkd4FEPwwAQWq0EdCpkDuN9LQCavHUBm9GpBlv1f+YJ0R923RIs5f/9MXUY3qmkv4IGoN87wp0PnpfZ4RlkRxVqEXxXuPthLVTRNTdsWdKxmUyCBHE3MRI=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CH3PR10MB7354.namprd10.prod.outlook.com (2603:10b6:610:12f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 21:18:07 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Mon, 28 Oct 2024
 21:18:07 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: sam@gentoo.org
Subject: [PATCH v2 00/14] gentoo, manpage, and assorted other small fixes
Date: Mon, 28 Oct 2024 21:17:49 +0000
Message-ID: <20241028211803.458685-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0497.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::22) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CH3PR10MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: 17f30da6-b2ec-435d-f505-08dcf796048c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Zqi6Tl8BOKx76wapbkX3J/pWsOqLiY0ACDRRCSAeg5cgR7D1VwYYoX1CL9FC?=
 =?us-ascii?Q?KXnwcusnkra4IkzVpILRlVyZ57chJPPhSuGyyw1MntM1ccr2SoR+UXvw+LUD?=
 =?us-ascii?Q?GLd+0+lU0H10+PjlhnfKK6KkvAfEtFWnVjnjpAItgdYNP8LXNoMa8CgU0xne?=
 =?us-ascii?Q?dJZyq5Z9LHQcwRRPMucvyM0El3Hv+SmTxvG+n94eof/RtvBf7nJbdCDWN5dI?=
 =?us-ascii?Q?TE/olMJ1fEXv2SSIsgOlH+rptudFZ2uBZ97UrDVMuMLWxCjX1d2x9t+rYLHx?=
 =?us-ascii?Q?uTyqJL+9kRgeMG4oNXkJ5ilnip1J23ocIw6JnPsob6gEdT8b+Z+nZ1r+fmhL?=
 =?us-ascii?Q?HDO+IoEy0FLmOpnF5PrsV6e4eR26at8ZpVxnGj0TZI/kqGvLoJSxkimgDlvU?=
 =?us-ascii?Q?LHoJ6ZhrmmydZKPP+E1UF5Gt9I5y7D5CLK0RZWq4PK0a2q7UdEvZ1sSZPcTl?=
 =?us-ascii?Q?VEeEuzO+1atuytxAO+AIixlX3NkCxrTBe50hNCtsasThf5kT8z7Mp3HoH4cP?=
 =?us-ascii?Q?3D61r9T9XYPg5iv6lC2KbMn9VmvOAFrBzcxOd1Is6KRbw6w0773scHECbYV3?=
 =?us-ascii?Q?iQ9gTHraWfFSHIMrdTkb9xyAbE6Ln2xwNWZ1ekKdgQBis/oGvDYGQr9FrADU?=
 =?us-ascii?Q?NQmR8XE/fKDTPkMffMMwfC4EyEvXlpQoCPSQ2PoahUiDip1Vl6M0FBVYkiyC?=
 =?us-ascii?Q?qZynttiv6nbhRDF0GB2RINiHWMtp9fMpUnuzfLs4x260D0RFxpHF0FGSyqsp?=
 =?us-ascii?Q?QVzMxJ1N7BIAUAO8aL/gHwY2JGyB0PH8BfjNQVKke7lUKtgBNVs7KuGfpPcS?=
 =?us-ascii?Q?xWOWFQSUaSebZ8REICsReVGQAH+W9tAc08FYBfuAHYvi4okaAj09m8O9acy9?=
 =?us-ascii?Q?KiSC+l+Nj4wUsDTzEDEJPm0Pc8CxXd1HMSDiESB/+dG/U7gEoYnBaVV9y8cl?=
 =?us-ascii?Q?N+4G11Gs1dtC1ra6pUo5VKe1TrqFsvk9ieGRhaM+jLTZ4yXgSieEUh9HKGpb?=
 =?us-ascii?Q?FYb3SpwhvdKiJeYX2fQwvs4a5x/X9fCPdD24cfnSnDpNPUZyYdeVqL/dCIk4?=
 =?us-ascii?Q?bq4UZMATQFJwQoT/h1SPFdAy0U49OZiCD2/KjsXpize3/r7cltDTOLgMxh4k?=
 =?us-ascii?Q?ZvcXyFDsmSv+cqMPF+LO1aogXzdEKTDpXQYcH51del+LpUh2gKZBiVVahjor?=
 =?us-ascii?Q?EHGNWUXk1lNX7+6bgQ2+WyS7scmZ6y/DEz8gWLXoF1nOKCKgI4un4MR6mKm+?=
 =?us-ascii?Q?mEyliIxPfaU2uMZbRV3yg/sH6UiSpPvJiFeMfa4aiJqt/5KKuSszFV/FeKuY?=
 =?us-ascii?Q?nHPjC1NXRq1Cm3oHPlSp36k4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?osyrtRRYDZer+/5ujlJE/bCBDxiTJSfBf3/D1ixVjUeuzseMklR3wnB1PMAm?=
 =?us-ascii?Q?6vAcrdHqFTYBDVz+EBv0ZB8UlSBiVWmbEcHJcOcrmdf15ygv0dU3DteBwCTP?=
 =?us-ascii?Q?iclgT2X7sXQJ2/bu3BShnTUc928gI/Zs8vbArMN2mT4oOt7HL200q4XpZeKB?=
 =?us-ascii?Q?fKE4FALHxEAx1pltdkuTihGZhb/8K02f30Uy1GB8NsEabtaYsHWCaMjXugEG?=
 =?us-ascii?Q?PyNEspN82SEU4XzyF7i79CrNMy387zHaIjDX2fC8gvEXqfTtQKllO9oVYuQx?=
 =?us-ascii?Q?R2/gKzB0fQDv6wcFymw1ui5pKI0y7CBbcrfmzEnObX9CK1Z0/fJ4OeaJlsLp?=
 =?us-ascii?Q?g2iGGcMN81JmEQ+OklvN+aAjcu1qc6bES8kw4Na8Cz0x099AQT/FmXo+BdbW?=
 =?us-ascii?Q?iOMTRVq3Rhzy1at+YpVS+0o1XxD2pknegyXR44OOAz1JTD7Zxqa0vnoJovug?=
 =?us-ascii?Q?3N917USE08cxfMRnb0yAqf2DjXjYJv4rzv58iREyht3dVGMcUkPHhC3/OJ7x?=
 =?us-ascii?Q?NgRFiIdrcWGQwq83GEP5uhYIJf5d/Urhn7Dy2vWS78yfuRtMR4YpbJwQRr6p?=
 =?us-ascii?Q?HP9VHtrpsmXT94e6aHGkW4qgqAaaHOc7WOEubyaAV5Pn/eXQ3Kjh/NxcAwKk?=
 =?us-ascii?Q?WiWzHibsDLHroRW8X+9AXj2/TH+fE/ap6vsjIilARwW79eswdKB4hfhryNIA?=
 =?us-ascii?Q?Y0WSnUe3hgQTlilGvLDOsK2ft7Ax/27+Z6scpuPJ0n4ERHRiHEcudkWrUEP5?=
 =?us-ascii?Q?IH1o5N893qyc/TVtMd27tloTZaHqi7Pgaxx7xVzcbeNEeJFg2zBFJ0aofelr?=
 =?us-ascii?Q?8MjZD/yn7AVKcWHNFmRxujbcSF5Zr6zVajsZrEflVO15C2Sr/3CvsNElKBkY?=
 =?us-ascii?Q?LB7sBuvsEFSVHJWhdqDC1bnHwfR4P1J9ZmNLV2nO9uOEHEnqOTH66qLWK5Iv?=
 =?us-ascii?Q?SUFW3Hq7mj7bu5ZcolwgPJ0rr+knZdde4J//q/8WDUURBBA8OXLfXVyp2MSY?=
 =?us-ascii?Q?EZvAyf3zbG/Fqe65zdiK2h9ALC70qisKVPWcqox2uRwG9BI6riu0WnBCIJSy?=
 =?us-ascii?Q?8oPs3BRKscpatm91UDb12BRtz6m8/lzBPhYrDtVJla8kwVOcLObEX5Skm0KK?=
 =?us-ascii?Q?tCLyG1DxUf8/HB+wvPpWI/eDvN9EAv4ZBeJC5axrTmxXpxyYBCD5YgTtwtqr?=
 =?us-ascii?Q?WI4YieXuUeACjdvs04Qa6GmNtGr1kj8q+2f2AMQ6v7UERgDNHnn3ud7lzzcE?=
 =?us-ascii?Q?gaNvxjc6yuF0TDVzH8g5y5h73enSKQsx5KUIS6rG+kPrzK2pLlh3DPEkBdi7?=
 =?us-ascii?Q?rwULCjcorhCGu+83lAfmOMIQ4JmEJGVhWws9KRVqLzSXJ8YRzqus4/CwCWlv?=
 =?us-ascii?Q?cyGVLSSNgjRbCVVao1364gxChzYZx6Xns9s6kaF0gxeauPTBsLVoEhxxBhfD?=
 =?us-ascii?Q?q/eyFadBxZMFcQ17klDYMmuxAVW4UDPpg9jwR9eUyM9N1Mg/KWJO8gXbZH0d?=
 =?us-ascii?Q?F8tvmf46Oqxcp/J3Sv8SM8SWG6uFMXMb3IciIjKFd/uf7Gbn//FnOs98xzma?=
 =?us-ascii?Q?NSCXlE7bTxCyVqA5wH3EWiz74Kc2inkOn3QsKLNTL6r1tcFiEo/gEsp3POcP?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8VdvyJHydUhgXcBsLQUchkyJFIMo0ebJRXOmuJCra4mh7j0e07FHY7jYWFrcVct1cuCeymqCCLvIguM6tkTAbT1CRCpUr/xf329plnujPcrZqagYESHMpjIYN91psvzXLXCUm+Fo375nSeE5NydOPgFe1yiU1TptSh9T7EdSPvQ1RppB05sjSJeYcI7znNUAWBAeWW/511yMOriMS1sV1s2SQIrom0K3z+FSyxM1SybGzk/5R51BGHPvg9N2Fr4uaAs4aQDhc2MHn5hbYQKMpwYOBbS9jBpMIrlmkDLDSfYhDKTdCq3Nq4HaqZ0PuBmLQv9RoWaIe28m+SaxFIimKFg/064N7x/7yROio5mwLlE7tuusNP489w0h/zvMghNIpTeq3amT2lZtoYAG0JMkT3QfxkNQELrWPvTRFe8fOjILdr/j7mDEWyMdH/JFvKzW9PTMaK8zL1gtN7Fl+gQJGyHGfZsI93+ETGRC/C6MaM0Vg7OrhWvcMz5iuEvWJ7E2tLn0jf7urK9lbHhbV/JLfY6zEycPrjjfI+JowVXV3O/HhJRHcNadWi5iT1NIP4xYstrihoH9y6oiJds5fJCrAWrRhgGvfR2LVP44+i20feQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f30da6-b2ec-435d-f505-08dcf796048c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 21:18:07.5047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3/fGUI805o0e9G2IIy3HNQExzRvFnj6N0YUu+0NhwOj7HPmyP4zxaSKkq+dC96NUced0T/JzAOF04fpT994Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7354
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_10,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280165
X-Proofpoint-GUID: IxIHdbaJmwg7qvd5sr8Jr5A0BWPH8uVc
X-Proofpoint-ORIG-GUID: IxIHdbaJmwg7qvd5sr8Jr5A0BWPH8uVc

Most of these are bugs reported by Gentoo, but their request for a
dtprobed(8) manpage triggered a sweep of the dtrace manpage too, plus
a fix to a rather unfortunate millisecs-versus-sedcs bug which caused
us to wait for an hour and a half for a dtprobed parser child timeout
rather than the intended five seconds.

The only potentially contentious ones are libsystemd (quite a lot of
code, and not ours, but it's BSD-0-licensed and I took out the most
ridiculously overkill parts), and the last two, which drop apparently
redundant markup from the manpages whose purpose I'm not clear on but
which seems to be ancient and is probably working around bugs in old
Solaris troff or something. We can probably assume groff by this point,
it's been the only maintained troff for decades.

Changes since v1:
  Review comment adjustments, and replacement of the INT_MAX
  dt_probe_lookup2() fix with something rather more comprehensive

Many of these have already been reviewed and have a reviewed-by: I
assume having the whole series reposted is nonetheless clearer
(I can post only the non-reviewed-by:ed parts in future if you
prefer).

Nick Alcock (14):
  No longer depend on libsystemd
  pkgconfig: drop spaces in variable decls
  configure, build: make valgrind optional
  build: substitute LIBDIR in pkg-config files
  probe: improve dt_probe_lookup2()
  configure: fix dreadful behaviour of MANDIR / --mandir
  man: the synopsis is ended with .YS, not .SY
  man: use \- for option dashes, not -
  man: drop blank lines
  man: fix blank line in environment variables list
  dtprobed: fix parser child timeout
  man: add manpage for dtprobed(8)
  man: drop double-\fB at the start of every option line
  man: \fP-ize

 GNUmakefile              |   3 +-
 Makeconfig               |  37 +++++++++-
 cmd/Build                |   2 +-
 cmd/dtrace.8             | 151 ++++++++++++++++++++-------------------
 configure                |  11 ++-
 dtprobed/Build           |   9 +--
 dtprobed/dtprobed.8      |  64 +++++++++++++++++
 dtprobed/dtprobed.c      |  10 +--
 include/port.h           |   1 +
 libdtrace/dt_impl.h      |   2 +
 libdtrace/dt_probe.c     |  44 ++++--------
 libdtrace/dt_subr.c      |  10 +++
 libdtrace/dt_work.c      |  16 ++++-
 libport/Build            |   4 +-
 libport/systemd_notify.c |  70 ++++++++++++++++++
 uts/Build                |   1 +
 uts/dtrace.pc.in         |   6 +-
 uts/dtrace_sdt.pc.in     |   4 +-
 18 files changed, 310 insertions(+), 135 deletions(-)
 create mode 100644 dtprobed/dtprobed.8
 create mode 100644 libport/systemd_notify.c


base-commit: 8a1264bf0e818c8624be250eb5174714b62ed93c
-- 
2.46.0.278.g36e3a12567

