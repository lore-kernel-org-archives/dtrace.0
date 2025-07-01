Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C18D280CD0
	for <dtrace@lists.linux.dev>; Tue,  1 Jul 2025 16:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751388131; cv=fail; b=gELRRa3/IFGCMyoFhLbtuFAAjAPFHAhkftRtRRKYYl1GhUQJqavw73pegpPbcZ5OGN3YynBgwwie9oxfawTFeR90oyDTwDb7fYKod+CjZVJiuDQBx8fPQmc/eBJ7LL9RgFcN4y1pL1GyFAAEXLZz0OHOQChJBzLJkRIZl24jNsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751388131; c=relaxed/simple;
	bh=ITN5SKssH+eOXviodZAfX1FJR3nbB63Rc2hgBhNuT/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mZeCuxXKdwvSYQGjUAbR6dMjMb6hnhDGuv05D6m3Y7bGXcQeVnBttT/bERNj2eGMEvtE38FYLR2k5pk9/4SQpRNcoamK0t+qma3mXtn4EWJ7G9HOQrRy4jO4rWaCehflUdMxYyzEqbThlRgJGvvxHGHFti2aF01lWFhbE6KbgH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RePSzSGZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CpZHXjuk; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RePSzSGZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CpZHXjuk"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561Gfh2Q026473
	for <dtrace@lists.linux.dev>; Tue, 1 Jul 2025 16:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=1685qRbss1OZgUlr8t
	FR/BVXFCR8E7R8p9xmPm+zgYk=; b=RePSzSGZUAd8m/BZf/DXRzc8avt+oR9oII
	k9b87dZdNzyzIfmYZN+EKCSocTb6b44baEDa79aABmoufF1kG3F3o9PcIed1JO2B
	yGAwU4n/nKM0E5EgkCEGqjWcbBRIqaxwKsX+7QNFAgGNZuQT6LQTaa5IeNF34Tck
	qAcBA4EA4YhKNKQNekC+mSlRoc2umppnmpEIPljNCEQKr+3je5OnknFRixjr/0D4
	hacdH7XqRu452vjTk9RFco5hjaaJls5wfiPVmlScymAsSKpEF2zNGoBlpA5qhC1Z
	olR1phoA3pgnV8gPsp9rVHo05oachPQbqvqK0VMMjPKZVDSacO0g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47jum7vfx6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Jul 2025 16:42:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 561GNv9A027522
	for <dtrace@lists.linux.dev>; Tue, 1 Jul 2025 16:42:08 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ua1c6h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Jul 2025 16:42:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a64mX0alQDlE6unfeHVzCzJNgPNifDcNLFhnWzxNH6Hkqy+IggTfxwmKWa9gvbkWetp//bcZLIZk9I1zK6n0aH1oXlTWCrZ+br2X9ubB0WbdwbuSgZIEfSo/GYmpTu928HLOnrJP0Ik/ueUlMnbwfufro39HrxOhusppKLORFilLcqbC5yuxzU/e98csTYTG8+I6eLsTjXFC43H0OiTj+ytES3RamNo3nlQgydrK09al0TBzjSB0pzlXEzAnFtrUMk9jtXvOWcdBj5ir8VqrXhmtx2ddKZnz/FlPlGUp4S7c/7RsUV4jaaD0XPJa85wxWXcxNFbDF8rioCVHhyGdSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1685qRbss1OZgUlr8tFR/BVXFCR8E7R8p9xmPm+zgYk=;
 b=x3ZSAg+lPwTgXEj9CXBRaXJivlmJIy6P4QpMufPxGj5+CjmXxHJTJVRgONjHsgy2IECd9UkVChnM4KO+9RnFl4OHlSXkujkoVu/Z7TJqs+QfdvHCzgWaICoLt+7SZOo3+kEyGRuJCmi7NdfFyHVRMoegunwz0qafBbiD4rRMMRm0n3A8D6qp51MzakFz/ek9saZQ66mq0Dvm97jytqEMoLW1X0eKw30RpUT/2m+pKRP9IiVGKVjALvL+8Q5i1fjvEEzZPWXriQlwZDCoG8Pz03d3nLYgYgRWb3ih7bd6TOs/E4oFUCCNA/LeJZJCckNdeOlcODeh3EacJBOB26Bfow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1685qRbss1OZgUlr8tFR/BVXFCR8E7R8p9xmPm+zgYk=;
 b=CpZHXjukvjzRHRYbXmzdtCtup9h5LJqfslfx4fvwg4uQAUI2YBkxiO18Hc+kXvVwJyc7nVW05qglLz6vn3oestdoKxM7cIh37FSecctBQLSgi6XQ975Pfv4yHvUOyRtMmljzMU0+WPjvJIwZ+bw1W2C2lmUUfg6UDCRXMSZOUvQ=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA1PR10MB6172.namprd10.prod.outlook.com (2603:10b6:208:3a4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Tue, 1 Jul
 2025 16:42:05 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Tue, 1 Jul 2025
 16:42:05 +0000
Date: Tue, 1 Jul 2025 12:42:02 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v4 5/5] selftests/usdt: add test covering different forms
 of stapsdt note args
Message-ID: <aGQP2lajd+kAjj5s@oracle.com>
References: <20250623101310.1649756-1-alan.maguire@oracle.com>
 <20250623101310.1649756-6-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623101310.1649756-6-alan.maguire@oracle.com>
X-ClientProxiedBy: BLAPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:208:36e::19) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA1PR10MB6172:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c6d8d53-cbe6-43e5-4710-08ddb8be3647
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?enfrhXA2GVUPYU3c/kRpWBzDK0Fji4vwmklWr/Q0Wq6UMfMDQ3Zel2GFBgJ2?=
 =?us-ascii?Q?B96YvaSbgueU6ZhIt/7alDC7eFbvmz/Yy6J5Q/uQvNeo8tRCoMMpbbHfxzGw?=
 =?us-ascii?Q?Us4kWUkmsYmXSkjZ/goWa7Mm282asEL2u8QRYX7figFVXtcmTAKLUnSnkhna?=
 =?us-ascii?Q?qisCixwis7U7VLh7epQti5jPbxLaCykvqO5sJHnMnk7aZCxOHWl0U8/k0YlM?=
 =?us-ascii?Q?QG7+t/axuTV8nAXBN4QDOkwYVz8wV/IdmC/vV8MQCu+e6oACU4QVCN+ljvIs?=
 =?us-ascii?Q?KP/Zx8wpfJDByYdQQkQio34A7OXJOVL/PEMLneXSvvBxZR22sAlVnouwnv8n?=
 =?us-ascii?Q?bC6L/wujWxN6IojQSq9A93SSeR2OyeheSvWkBW3bwVsv45vtgHREPxBExEZN?=
 =?us-ascii?Q?XllQ/I2WbAfAQ6cqXS9ZhkdKKC+p7Z3yeUdC8lqX7O4aT2ub7r/wcH7CgNWf?=
 =?us-ascii?Q?Idwp52dKPnxBy6bAEmGFw1HYAyVhnZyZxSzBP42s4J759HDXZhx/aMxw75V7?=
 =?us-ascii?Q?PqsQUeM2JGG0XFZXRWd8a6NnRPlfJBre9xut7nuq775hCYAFuLkNYvY+4he6?=
 =?us-ascii?Q?oyM+Wi6UV2HjYE+AYVGFAkAFHHg2DJBExWa4u7zMy8yS9q3XE+HFOa1wC9Zu?=
 =?us-ascii?Q?xgEBg866xlQi5duqmQaacg+UGrcp31eJ4/CawvvoYb1GmMK80DpUDfdXrca/?=
 =?us-ascii?Q?n7ADjcXFuAdYahbnCi9LLH0L9XW9LB5w1RA0YEsbCmrQraNETefqGrJaW7LZ?=
 =?us-ascii?Q?1QPWJrKCVr9wTj2knL7f7xOG2mK7fr88WvM+1hylid76ZFmejF3x9c6UdlhH?=
 =?us-ascii?Q?8SmYimhAdy6Z1osMTbfbKTh3G4U5OfHajS7Ur/odqZPNYOnVTXoOPH89kKua?=
 =?us-ascii?Q?zTY++MRBAdxUJKeMp1kJMh7vd+/Yy1LR544ivt8FmodntGF1SEGIV6iKFR2e?=
 =?us-ascii?Q?PmseKmRQkJjSAlMESlcHyyRXB51aHyeQqXMa5nQdkY+MjgHGAqBvG7/LqodX?=
 =?us-ascii?Q?IqTxEfmNFZD5tgc/1Oq/zdUr4G17RQ9w3k+y0CDnfdKhqdKgXz2foiinYTjP?=
 =?us-ascii?Q?S47+PtdEMdw5ycv5Dtu78myyJ0prY0CwKWF0aZFQb63D5lq4Twhk6lHK/njP?=
 =?us-ascii?Q?Avu8C+WY3UPWHBevtKy6iNPMCtBOg7C2pRJdvrMfzQaXQX+OuouVDKuCRdfC?=
 =?us-ascii?Q?Z8Lnw9+8Y+xK0XqMnUD9FwZ7oP2KE8DHpjcujn8zwRRHqsPQmJMDdPNc//Vu?=
 =?us-ascii?Q?SLitjUlFbPv87EIDshd3awBdzgW+pH2NTvDSAYuMweLK34sVM3f5d2JUr4fM?=
 =?us-ascii?Q?2rdi5uP5syMGmFiDYgQcXextLYhuHO2ZBgJeM3aQr65IDNMF+9DAm6nBdn4i?=
 =?us-ascii?Q?QU+muTtZ4Iot18AYciy/J507XCT1cAxlJKsA45UEjet/4/6Wv/7m9iBbaHFX?=
 =?us-ascii?Q?dOEN8EK36Ho=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M+pExkHXiuyfduvOhbB4RCI5ExC0IwRxpn1um6XyNwWwcuZ4tXGNy2OgUpjO?=
 =?us-ascii?Q?GzaHq89v2r7OmL47LpLUYDh939ot3q+92awcp7CS9Ul4dpqtkA41/ovT/giV?=
 =?us-ascii?Q?4ZW3RaybY+GUPNVXBXPG7EX7WcE9hzEjF+CIpf33GK0Gi51XLxKGrXO8UT/+?=
 =?us-ascii?Q?DQK2oIQsfrrcOXglSwUJ1x6jj1wDGmekdXe1mzXn7dT29tCT3/5LLsYMYT4J?=
 =?us-ascii?Q?86kHdogfiR2xAnO3pRBykwBK4wWjjIzFa9E5VBJXsMcQTi0Qj7WijoFw2X10?=
 =?us-ascii?Q?o734akrSk2u+uAI9IB/KB5VGItQtb+O0iVbAfYXFgRrzUG9RINtD1OI/cKmK?=
 =?us-ascii?Q?rb5+szRXsckdVP7WTenUo4/khZbo0pNX13ylZ98xSj1KNmIMw8lAzpViFkmx?=
 =?us-ascii?Q?S7VE2cfca5YQsYLyJ7SYtp4pVKvl+SRPzyUWcefEjMxiIhfOBmRu0uTWaYU3?=
 =?us-ascii?Q?gVxtKnF/lY57LFUecSohjlRTK8q+guhdh8fuutbHa2bXBQzK+DNpjvfd0INz?=
 =?us-ascii?Q?vzQdGVMRYEFh00IyN3LaZGUHcjhaHE1P7d/c746HH1bwfBKs/KGnghNfT1am?=
 =?us-ascii?Q?TBeNCAMRMa40eCH0P8OhazqjD1dmPIa/ECymEb3cC0DM5H4Iv0M2gfzavJG3?=
 =?us-ascii?Q?t5CxqvI8DYlecgmF65cuQMhTLGovtUoI/1emxrRZcNmKkb9lKrs8+p5BJm6n?=
 =?us-ascii?Q?0gMPQY6zM7/kgOwrODtOw9792sOdihzbN0LkaoOHms4jPpwVjj96BR637mut?=
 =?us-ascii?Q?yELlPfAaK/t05BUvEXTBVmNClro+678Dun4IAjst1PZdqFgMv5m2GqlG2ER4?=
 =?us-ascii?Q?9qatlmq2pdQOiXBsGbXTDElQXqy9ntKS/084grmIc5DmKf/kCO3COCIhLUk+?=
 =?us-ascii?Q?qn/MEEtyLR8VXQKBdTMWjTzWYzt5Eh5sAALeo+S6Id9RR6cxySi0ISj2h2MO?=
 =?us-ascii?Q?mK+9qs0a8tc0FzoAGmzIrpTKjqS/+YqX7ydCbjM5e2injfyS6DMlk5Ecyv62?=
 =?us-ascii?Q?pyzIDxSPf1yByIsF4C3yFusLZPsrDu6eTg2Ax9sdzerSnbJXz6gsm54FGFEi?=
 =?us-ascii?Q?FuE6tIlFQ+PWryeoXfkBQhzgZoYV1MA9nQPGcK/gmnKDCT7tLO/uop3K63kS?=
 =?us-ascii?Q?bMk3TixvdRB2iOUjuAe3PMCirSZiMzcF7qaaiBh++Seo8GmBKUeg0UE5Io5b?=
 =?us-ascii?Q?OojRoAUEZ0YxIbnkp4BtMlCmBOVRdkx2Vs/iZabs9z6AZq2y5ho0B0tcHdEe?=
 =?us-ascii?Q?9kOMeiSR35nDVBOAB9y/CLlVp3XlnRyi+24r4KAiSaFzMm8f1Z+ESdxrkRWs?=
 =?us-ascii?Q?rsJg6HkT5rA7i/ZOZn6CVBgWOWubit0m3GURoR6UFebDp6Vc681QKwoPXDbd?=
 =?us-ascii?Q?brB3rxIuTi0+sTM6eeVSYOQDFpXxktTIV8OoQpVqUVuYD9kHcXylODoV71Yq?=
 =?us-ascii?Q?E7DMwONMHPJP12EZc8jw1wNegwJhPDzshxxiz4vnNc8I30mFgueB6FQxG0Yq?=
 =?us-ascii?Q?QzqhK9MlL0VV3IReskn49CkIANAAN2HSTXFxsiiBhhP4igXsgMXvDXkezUf7?=
 =?us-ascii?Q?6RRfpWR7affV6LVorrKjVkH301YTlNte3bClG8xHS5miNl9ddYVCNeLIYS3e?=
 =?us-ascii?Q?Rw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	x5Pq6/pommoe7evzYsSazPMfOTThfEcuHOqAp58XlzaL4zfxYmFglI9TfA8BUninnmZR22ck7GROWsqFsa/Jj3S2+HtPNzbm1pC8XNOyEI3ts39y8BX8S0ze8NPF3jxbjZmidwJ1r6f6+H7w+aQd6TbFd490abpZfDskpvNV12SoLmgOJqb3kQPrrOwRTfd+O6wXviGNWn1+hC5c85J0B6GELjHwWuzBbKvlT2fF/wGW8ezPVivpRuHgZ4f3whvh8JszMzIYH+qzZhp+jgmsM+6nn5mDvfQudxDuPQy9Bkx9nrwexSdErpJ+BBBZ+9mQjWkuNOx52wNviwK4p9gzlCcx6PcQshE91hteO8LNkE4BCydxec+XHiXblyDw9S7WF2MliHN+7P7BeVSSvLAEjEOFmrgYsGe/HSfOzjw2JYoRnzI2HkCb5VomVu84lxAHjKnB7hR1eQvjcxbiC1GbgAn9XtY5A1ePOnk5fY7G5F3QEerpzR6ukSES1gLEra5sIdc/gvSMsIzTT3k5jR8DfnwGBvmm/GJWxdiYSovl0KahJMwDBaLFtAfRHmwfSisNXdFYvjy0mYJFfg1r6l/C+Bd791+nMhaNmIG5+ae0aaI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c6d8d53-cbe6-43e5-4710-08ddb8be3647
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 16:42:05.1683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5sNfgho/99ZbEEx0QOwLej+s8HnTgp803DC+qMlo72sNlV7nqwiyW2hWPmpL8M9v9+q8MkHpLrRa4R2Xv7QvTV710E3ZvkNLLPpybnmELjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6172
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507010113
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDExMyBTYWx0ZWRfX1Z5GT832pbAQ Qsu7nH3/oQrzJZbcEYRiztEmxRzwzoWMmo4gIXvvehLACzOHj8XfLSj7snqUAAmh0XDauwiisrF 76It6eklcUW2igUiwDErUGLY0V5vwz8mJ8UJorx7Ijb+Mqc2iL22E62Qro73ArdI1IGFoUSZIOa
 MYnkk/6dAKTcuFSzBBAc2TFe9OP+uQWq1b0F+ShSnQ+v33L9K0Yv4ucMyFvGuS8G1RTFij+VHow OxDeyiZxrjF07zrkvrYwI6iI52U/Dblhi/jqlQ+os7otHPssxxog/sRxUuix430GtzouuPIf4K2 TWPmWlQHYgA0Y1RJ6xDd9wPtr2MMZXGav9NyuP1EtLULp92rywqK7Nkr1St5DZ/suY3qgtuqfWJ
 4sE+TNUgbQ49mytE4iEcBiGNBalZ3mBvjXBJsW1ibXntEIgWuwZMe1l++Se0Ae2o+55kVFkP
X-Authority-Analysis: v=2.4 cv=MvBS63ae c=1 sm=1 tr=0 ts=68640fe1 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=yZOin7QUJAeuj1SjD0UA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: EGSt1RAOpmoCFcloVnOqG9dO42rPvMSK
X-Proofpoint-GUID: EGSt1RAOpmoCFcloVnOqG9dO42rPvMSK

This test does not pass on Debian, or any other system that compiles with
PIE enbaled by default as far as I can see because it fails to resolve the
function name (even though it is in the symbol table since that is not
stripped).  So there must be something wrong with the logic of the
implementing patch to get the function name from the address information.

On Mon, Jun 23, 2025 at 11:13:10AM +0100, Alan Maguire wrote:
> Add a test exercising various arg types supported by stapsdt notes;
> register values, register + offset and constants.  The test generates
> a binary with probes represented as follows on x86_64:
> 
> Displaying notes found in: .note.stapsdt
>   Owner                 Data size       Description
>   stapsdt              0x00000048       NT_STAPSDT (SystemTap probe descriptors)
>     Provider: test_prov
>     Name: args
>     Location: 0x0000000000400557, Base: 0x00000000004005f8, Semaphore: 0x0000000000000000
>     Arguments: -4@-4(%rbp) 8@%rax 8@%rdx -4@$18
> 
> Verify we get expected data for the probe arguments.
> 
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>  test/unittest/usdt/tst.stapsdt-notes-args.r  |  2 +
>  test/unittest/usdt/tst.stapsdt-notes-args.sh | 50 ++++++++++++++++++++
>  2 files changed, 52 insertions(+)
>  create mode 100644 test/unittest/usdt/tst.stapsdt-notes-args.r
>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-args.sh
> 
> diff --git a/test/unittest/usdt/tst.stapsdt-notes-args.r b/test/unittest/usdt/tst.stapsdt-notes-args.r
> new file mode 100644
> index 00000000..42bca19f
> --- /dev/null
> +++ b/test/unittest/usdt/tst.stapsdt-notes-args.r
> @@ -0,0 +1,2 @@
> +test:main:args:2:./test:val:18
> +
> diff --git a/test/unittest/usdt/tst.stapsdt-notes-args.sh b/test/unittest/usdt/tst.stapsdt-notes-args.sh
> new file mode 100755
> index 00000000..82097808
> --- /dev/null
> +++ b/test/unittest/usdt/tst.stapsdt-notes-args.sh
> @@ -0,0 +1,50 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +
> +# This test covers stapsdt probes fired by the STAP_PROBEn macros,
> +# testing various argument forms (constant, register, deref etc).
> +
> +if [ $# != 1 ]; then
> +	echo expected one argument: '<'dtrace-path'>'
> +	exit 2
> +fi
> +
> +dtrace=$1
> +CC=/usr/bin/gcc
> +CFLAGS="-I${PWD}/test/unittest/usdt"
> +
> +DIRNAME="$tmpdir/usdt-notes.$$.$RANDOM"
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +cat > test.c <<EOF
> +#include <sdt_notes.h>
> +
> +int
> +main(int argc, char **argv)
> +{
> +	STAP_PROBE4(test_prov, args, argc, argv[0], argv[1] + 4, 18);
> +}
> +EOF
> +
> +${CC} ${CFLAGS} -o test test.c
> +if [ $? -ne 0 ]; then
> +	echo "failed to compile test.c" >& 2
> +	exit 1
> +fi
> +
> +$dtrace -c './test arg1val' -qs /dev/stdin <<EOF
> +test_prov\$target:::args
> +{
> +	printf("%s:%s:%s:%li:%s:%s:%li\n", probemod, probefunc, probename,
> +	       arg0, copyinstr(arg1), copyinstr(arg2), arg3);
> +}
> +
> +EOF
> +status=$?
> +
> +exit $status
> -- 
> 2.43.5
> 
