Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1D2179BC
	for <dtrace@lists.linux.dev>; Tue,  4 Jun 2024 18:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717524020; cv=fail; b=XTaSoaJxvXZq1jBGTkNEpAr+z5PevnwXtIeiGWi3h6bGY+9V/QwRuNM7g2POswk4NpjgyC3aP52bS1kSR3o4EoYqjqgeo22CVVfVJ1udDNAQMbQYIDzHklI2fHzbAeRXM64bKZgjxdxAn6A2fHaWM1L1xkRG6G699bsxhs4KXXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717524020; c=relaxed/simple;
	bh=T12hPXLERv/N9InyfdMuxp7G4hOi/zERSNI/GL65A2o=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KiPQCXV08rrnrWzOGwP7j4i1IcSXjEf2Yq1Z+uLKk0tJ0N4rZlc7XBfzW7VE3l6h423qc/IT1ylCIO5iePG0aUYMfM1Ljc5twjjVFGTBUna2TRZc0DcKeF1BrUtbRVf2vXSDxht9ZLDlNefApdYGXu3o0KvCfa8zxCzG+aroWs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 454Bo0c7024658
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:00:18 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcontent-type:date:from:in-reply-to:message-id:mime-version:r?=
 =?UTF-8?Q?eferences:subject:to;_s=3Dcorp-2023-11-20;_bh=3DtkZCVBW6U688+tm?=
 =?UTF-8?Q?khHOFnxYu1yM0CFTFAF9zg9KlXN8=3D;_b=3DVBv4vROb2wK/L9Cz9U8jSnqKOH?=
 =?UTF-8?Q?T5powOtmLeA37QCyvCSizEpbKYor292X8KERuMo3U+_Uq4TMu3+NfxfeuCeNL6q?=
 =?UTF-8?Q?8q0fw/nFgZeNdnK8YZfThcIPrwQJahbnBCo0ghUCo8syIbnC_zJJw4VTyxSnisJ?=
 =?UTF-8?Q?j5oEkFvijB5dAZ/e5l5M5ENUNBg4M7TBCBcGkaWPKWrG+TuABZGGFn_DlAPHnN/?=
 =?UTF-8?Q?b/a1yxyPEuvUyvxGy4CAKDdL3ldxoEvSZy78IQiq9xTrCO6XVA65D7mUwtsM_Xy?=
 =?UTF-8?Q?auVXyiP9io0k3YC0vScjZq96rpYa6Z//ti63oFW3IkPA+Ne2vZ00kFtucLw6VZb?=
 =?UTF-8?Q?OmI_nw=3D=3D_?=
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yfv3nwk3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:00:17 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 454H9wLY016171
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:00:16 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrsafpgf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:00:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRMkZhgiRhui1cD+FkJlb8zv1mA2SBTPFQy3GW40ebVx4yn2Ag94b4bypuM/ny+iElduYxRayrzu7o9Rl2MxhRqna1hkgBSQ8r2j7ZTNz745z6egEiScJefteRd1gtG2bGZefBAzpafG0nRHUszct0Sdc/h/CzyDJkRJZoFjA3/kJcc2NvPcgMmvScr23VqIsRrBc7Wt51koPNPHKEdSo7pMmEFrmNxbUGCDQyW7KtgZbAThrZqpqpTsf+hWC2VhgnFy2F7mZswzQX5FoqMzydeMSMw6mzewUCO9oyJkqNkB9oouSWseRLIQfQCR09hMGeHM2oEz4ix4xbuDUB7lqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tkZCVBW6U688+tmkhHOFnxYu1yM0CFTFAF9zg9KlXN8=;
 b=VTmbUZy2BTPhtwhl1oBNsQPGss4PB6CkffKKjXt/u5OD7rxoygSsgl5Rx3kBRVZ9IOoYwcPi3UlekiE5NpFr3E+ixVd7HBCPNhypHSEDo1zakD+9zX0iByOokGFeHqYurbQicPArtf5Sav5SUZD4jn11xJGFgCKuYmgMLN3cj9Vx2XeGNNIwJn3fcNLNXZW+/jK2AMferN9Y9fRUHGR/ZVCdDich720Wy3bNsCT0fw7SmZgkQiuJgmEwM5pyRknpxnvw/x8JNwhSPBHDD0LcWFQZz38Y2quT4agGyxD2mYcXhE67Mbd5zmxUtTRHdO2QnJhDhYDDzIIYpXfyk760jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkZCVBW6U688+tmkhHOFnxYu1yM0CFTFAF9zg9KlXN8=;
 b=V+nHXFGU00+4Mgwh6dCF7CSSGPhh5oc17M9bRcXFzTBcRAxVXRUo1NtDrEQBJqn5lExNoszACzoCskOnQ5d3OMUaQf5HmQoQaQ8VXeIpqdyIQ4xiCfZ9Cv82+jTVpc2cBdXk1y3RHU0ronEu5LYC2AJfZLGGBx9as8A/AOSI/+s=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH8PR10MB6574.namprd10.prod.outlook.com (2603:10b6:510:226::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 4 Jun
 2024 18:00:13 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 18:00:12 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/8] Reduce stack depth if kernel returns NULL frames
Date: Tue,  4 Jun 2024 14:00:02 -0400
Message-Id: <20240604180008.11331-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240604180008.11331-1-eugene.loh@oracle.com>
References: <20240604180008.11331-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0073.namprd05.prod.outlook.com
 (2603:10b6:a03:332::18) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH8PR10MB6574:EE_
X-MS-Office365-Filtering-Correlation-Id: d9226b3a-e581-487c-3714-08dc84c02e85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1kBucwIG0D1eF4Ffy8ljO8+VgILqyb+9V7B4PT+r7Hz7kOdRbBczNkeSc7+y?=
 =?us-ascii?Q?BligpDtLfJm4yH3jj5P1FKhLt863CeVTlEEslvteD3fdxhI/kXU6EAZdzWsy?=
 =?us-ascii?Q?YF5G5YiCA0Qyy7wxK2JOaMFQCZ4n8t7ZDUre+WfKhe7F3D3Sax94T/saZrjJ?=
 =?us-ascii?Q?1fxh5blE3kqRA6f8oh7Q6oAY0CzXveR4QO1aAOPwFUQRzczZXq0tnRciklet?=
 =?us-ascii?Q?Ly8DqNet35fuGWZfsddnjlU/M7Arfwdx8MHTxx191F8QGpdaS7lmvnjsg0h3?=
 =?us-ascii?Q?9sPLEPEDI0p2ZmfXQun3HxtUUVXMm9YRGXQI+MDARWW6su8/vWFGSvzTH66j?=
 =?us-ascii?Q?l9xF2qoX/3Yhb4V6vT11QdRSRjXnvjw1Szn8l17fq1ckKAaB+TZSX7GH1N4i?=
 =?us-ascii?Q?hhih3XEsWH9ljsTILYIkVQn9qWXXZwC4T3A55vWjW91AShYe+F40Om9lUHaa?=
 =?us-ascii?Q?TLKiPTr9X21uMqEerUiZEyKyqpHGx1gVr51cMPmrkWMVHPjcZ/pTMGiauZlZ?=
 =?us-ascii?Q?twxw0AcBou8PoLKd+iZJ0VoLhtL7CngmcMHq/VJaG5vNPCy8XFxxy0rz/ohX?=
 =?us-ascii?Q?Lxkx7S/f7daZaVMW72iWFhRLmiPAskpppHubJ1HCNe6fdxWSkdKkU4v6z2Qy?=
 =?us-ascii?Q?S8lnJubZ/N1UdnNIRUb3eq2nowZKARuhikuf8DkNbk04mfthk2uZ4CZNjwEJ?=
 =?us-ascii?Q?BZSTida8Puy/lN/LE5MJIm2cvbKAykxNJh+cigB9c8EH/zBtP4d/uJjysMKt?=
 =?us-ascii?Q?YyfLtqHOIrVhdVEwqsKq2NPiT8qQwHI00PErmq3ZRhLE7CJsIKUK2luW3aJc?=
 =?us-ascii?Q?rVhjKKC4iqydm6UZ4xlS3gI57Ps9EKfspEl+IQIKOhM/jHce2wv2XSn5LHty?=
 =?us-ascii?Q?7s1OrvUkgsZ1D0mmMJj+u0ce3WHRCSyXsidQNRJSzZeju5fndikEHLTeOYkr?=
 =?us-ascii?Q?bxktp02Tn9YENsbencHDRI8LJCc9UxI92T8U9wz54HbgFCXvj3TmC1hO/Zad?=
 =?us-ascii?Q?nd4Fts2iZ+Gim4AOyJ8tAgN5kScsHzG9dYZDE5KQLH9uhqnOAkk+09llbgfr?=
 =?us-ascii?Q?vfOtDeMYXHKT2XUQCt8Gp6Kta2xuFVGBhS3LS8ss2scM8Zm+BU8W5rBVd9eV?=
 =?us-ascii?Q?BKXZqqXA0Xzo3anoepRQYp0s6dySM17bjkTmaqE4Pu/ELIpNLmuexGOAnjIC?=
 =?us-ascii?Q?wyoR0w8w7spD1UvYc4DcfKJ+a5xMhpGHdBIk3Y5LgX4aOJ7OqQR9qawzsllP?=
 =?us-ascii?Q?EksSz4btiMDrpZuyb1KzEMmXGJhIEPaRXm8dW8cd4gwEriTTG7RVRYVzUjRn?=
 =?us-ascii?Q?9/s=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4xvr165Vqd249lr8PlXBTsXNjAUGSkDh/tK1rSkwZQQNViXfTBq73cmF/9ax?=
 =?us-ascii?Q?0akfIN55SqGw8ZnNmAprThbahYOi/w+Q+qrDtSn8+1wLN2GIUtSaFkDbb+88?=
 =?us-ascii?Q?BT7z/pDJTChduKy5ZI781QLQDRE0BjpNFCNktKQN3bmA17uXu04m88NfE23l?=
 =?us-ascii?Q?DT6yV18B1F30ZdOeCo68xbi46G8FYejERnE/H/qve7mLeyvbn3qoI7Tgq+KB?=
 =?us-ascii?Q?bYTs37UItVP8EK6EsIWjZ6gnorxZpibHjwGorGXAgkcqQoGpJ6kfg/kihjEV?=
 =?us-ascii?Q?c9EOFz4OaP5x6CtliKZioY2Mjov3eB7yU8pJtAh4iGdmYWhj48gnKulYPGFi?=
 =?us-ascii?Q?Ym5PPPh6F++iMESnh/eBUy+eB5lp6oBZC6kz4y3r7jpFfizSdxJM/i8RtAld?=
 =?us-ascii?Q?arlnR6u+499g/9R8aCUIB/rwx+n0aCDUjJeNwsoSJvGe0NVViD/GEyXtU/iS?=
 =?us-ascii?Q?h0M4uSzz2K/ZQaIb5r94dKxKwiLiWkQJZBC1DZVG0ISjY0B3xSQa6o5vmdab?=
 =?us-ascii?Q?PU+UTwlmjZ/LZtHyjyQJmJibBSzORqWCHgIOSBLo0sQwLyoObp43GyuOSmK+?=
 =?us-ascii?Q?cwQP2gGWtEYTdxZNJ+D9IiCwgAieU2MjeG/NfyAHgCfTFxRKHBvsGbKB+GAa?=
 =?us-ascii?Q?GrSuYeCpKBQlYBMMR8QIVrhK6V9KwYfQHOL36TNw+NbPoSISye4KbNTBVp+v?=
 =?us-ascii?Q?Q5NxwJAURC7wyX4e/qdr3pSPdZjr00OfxNR0SpVdwMR18I75jm18dJSzHx/i?=
 =?us-ascii?Q?wV/ayIVZYQS+EzEdI9mu5ARDoImlsMy72FqvM4CzHycv9Jix4nWIaEEvFMM8?=
 =?us-ascii?Q?zHyHZN+uuYkE/nlWysmiJWlzwRhTIm3X/BU2AIZ5zMmzuFSog6BxCpZn6Odg?=
 =?us-ascii?Q?AyL3J/wRjDEEeai39xDVuHSLDc/6AILOepP8BC2VraRVJiJJQDS5W8qHBOV/?=
 =?us-ascii?Q?s2kbLdw9uXb0x0equS76GUS2E8VzPDg/kPwv5ovrKkofaEcQOowubC0XZPGv?=
 =?us-ascii?Q?ZY+h4PkNA3U5yqoVIh6iIs7Ht7/eEPzDHjmdY4I0IVkZwPKi0+4MK5lWz6v7?=
 =?us-ascii?Q?DWAg7+h+21T4Vx/PZ4SGAa2pkqlOP0slGpcSTumGX0WbXBiViaVcykqZh1Mk?=
 =?us-ascii?Q?ZVPLix1esBbwSEeQ4grpb3JB1je0xJx7X65gdfV5eashBgsY6G4Xnfehr1k3?=
 =?us-ascii?Q?J3MxJYLpcRtZft+GdoSfUYHHSkmEMA6dscwIMAjjMxJNoldU6p0TZXxiOmoZ?=
 =?us-ascii?Q?F38IDcD0GG+CTbpyFGN4XaPzhcr28tOd1bCjCySO3FUPSpfFuLt7ZMnhyBLD?=
 =?us-ascii?Q?2yKErL5aDH26+BhoidDUdE1jn/vNftduSgs2cjZ6jQVrU2CkQvZjYqPb3YSO?=
 =?us-ascii?Q?hxQIEScBsASF+SPEycQw4lDZXI4MZ/r0VO2CYvewHQ6PSgCW22kTcXZpmhQj?=
 =?us-ascii?Q?VcIUVFIb7K5xfEjGolRt2XnA2Dd/iwSV9UVch/TkVPMwzHw2zOkHSAKyFWRG?=
 =?us-ascii?Q?4Joa5PQpPvS90bI4w15XKkfFD1hlibhFezkginitTG4UPz5nzbaisuqJLO0C?=
 =?us-ascii?Q?+JKaNyV+xaRAIaNvHpS5iMle6AVrwaHsKBbGxfDs?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	lgwHw3c/mC/k3f1ksg/moBXinTXZVmSWMSFeZWSAjgyyL9R8DB4ZM81zW7ivTETnUYsHCjVG5HTmXoJjvubLEHcWAvBuO10BWFaSnlYf5jWNrwV8ykSlaM8tEW9HpBjQ0Uu50b0AX8XtgcCzVRsMjQ/oA0RBwn2B3t2ygJxdW+wzxHntqdbiAM6mCxYhQo8/mwWrbWax79XV+JzeXoV7ZxvWUtNf9vmuKjcUZTQLg83IuJUYEDMRJhY8dCJ+C0MfX+7RkIJjv/1Vlbu/Zkq+a1H13+fvozlTRh+qyvIrYJn56idS0QzkidaVnG2TcC1NX9GthEGFliPGrJ+p/Bagk7DvtUT0M+OBNbxLrH0GSLdoNxuzc9pecO3Dw5cKkTRmijl/ccJ/daWpERsQ4tzTKX96hZTejc7QVu1iFkWbgHIoht9BrU0x9OU1BN/hqMKHtY3rGVPX1RAx2I3MX//4Z4JiNkbCkiZMbUH5eF8HZ8CvmsEAqOc0KX7xyamSy02xqG5YzmQ/y9Tkt3ZVb85E2QU8dF2/nMhDgKTxQKLo6z1DFFjqSh/hBN+ujX8M2apEadYPfCaR5vOAQO18dJCoYlfSztuLLjUDSiqczowkNhs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9226b3a-e581-487c-3714-08dc84c02e85
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 18:00:12.9552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: egBAISXHO6XWLD/00V0JwfJUJr74/7Me10QcAESAzwLS/xT60dCPkzgfenHNFfuxOVPhNE68uqu0VNw3E4QECg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6574
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_09,2024-06-04_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406040144
X-Proofpoint-ORIG-GUID: li1INrHZK4FsZpfUWf7Qq7z15n5SqIxT
X-Proofpoint-GUID: li1INrHZK4FsZpfUWf7Qq7z15n5SqIxT

From: Eugene Loh <eugene.loh@oracle.com>

The return value from the BPF helper function bpf_get_stack()
basically returns the size of the stack returned.  We use this
value to report stack depth.

Some of the top frames can be NULL, however, leading to some
inconsistencies between reported stacks and stack depths.

Add some code to reduce the stack depth if one or two top
frames are NULL.

There is an existing test to check for this problem.  It will
appear in a later patch since it has multiple problems.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 bpf/get_bvar.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
index ea5dc6b1..a0c04f3a 100644
--- a/bpf/get_bvar.c
+++ b/bpf/get_bvar.c
@@ -67,7 +67,9 @@ noinline uint64_t dt_get_bvar(const dt_dctx_t *dctx, uint32_t id, uint32_t idx)
 		uint32_t bufsiz = (uint32_t) (uint64_t) (&STKSIZ);
 		uint64_t flags;
 		char *buf = dctx->mem + (uint64_t)(&STACK_OFF);
-		uint64_t stacksize;
+		int64_t stacksize;
+		int64_t topslot;
+		uint64_t *pcs = (uint64_t *)buf;
 
 		if (id == DIF_VAR_USTACKDEPTH)
 			flags = BPF_F_USER_STACK;
@@ -87,8 +89,19 @@ noinline uint64_t dt_get_bvar(const dt_dctx_t *dctx, uint32_t id, uint32_t idx)
 		 * what we can retrieve.  But it's also possible that the
 		 * buffer was exactly large enough.  So, leave it to the user
 		 * to interpret the result.
+		 *
+		 * The helper function also sometimes returns some empty frames
+		 * at the top.  Bump the depth down some so that the stack depth
+		 * we report is consistent with the number of frames returned.
+		 * Arguably, this should be fixed in the kernel, but we can
+		 * work around the problem for now.
 		 */
-		return stacksize / sizeof(uint64_t);
+		topslot = stacksize / sizeof(uint64_t) - 1;
+		if (topslot >= 0 && topslot < (bufsiz / sizeof(uint64_t)) && pcs[topslot] == 0)
+			topslot--;
+		if (topslot >= 0 && topslot < (bufsiz / sizeof(uint64_t)) && pcs[topslot] == 0)
+			topslot--;
+		return topslot + 1;
 	}
 	case DIF_VAR_CALLER:
 	case DIF_VAR_UCALLER: {
-- 
2.18.4

