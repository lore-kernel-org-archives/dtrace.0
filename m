Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312012E634
	for <dtrace@lists.linux.dev>; Sun,  8 Sep 2024 16:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725813629; cv=fail; b=tHpP/HAkTLwJhKw3yMXZaiXUUBCQrpSVGJCmaWAlfInJy9RJrvyuiSZb8zdz8YI/ci4wbu/KfJX48I/2jEGdYUKMJAMojZSLO7uw2y6stOK7xukWCwrARI8szK1aEM5yn8mFEVyT5yYhE3kIJgrVU/QIwhrJivcxYMgWxQidaW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725813629; c=relaxed/simple;
	bh=36AmnE94Rqfg2oLEnM4krjFKXEgaTb1SvI2lGwmSgxQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WryK0WvjygfnybV/or0jwNBhuxoadyKVTxV2OJEgeQ8NE4R3WTOkwrHIeOyEhaXu6l1S8ab/z1zBFfE+kPxNmtMds8UgUOPON+vlLwrbgiZCG7wMDpX/hkMTWHT4w69A326cE9XAfqMg8n9VcgzQGqqJXgLj5tWTnzBDbHMzALw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lldks6NW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rDop1lXP; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lldks6NW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rDop1lXP"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4884MXL4014609
	for <dtrace@lists.linux.dev>; Sun, 8 Sep 2024 16:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=ByX1phWj+2RwHD
	AiNDXyF7BC/9avrm6UWdDtm+9FHNQ=; b=lldks6NWmQ+ChrBEO8n8DZUkOy7sXg
	KIKADTiynPQrBsx/jOyLHXbwvBmSYhszVuC1dZhDbk5XiOeQF43Bd+GWrnVqjZDg
	65x79mXGhcgGquR+ghc9/JPMDtM8nF1Z3yf/UdzPxKdUjKCktp//tT/0T/K4C8O4
	bx4zz2X38u5igKp5KChTFVY5TQL6OMDgkpiA60Mcp5p3nfY3E8+pxS6QVjct2MF1
	RV34XierrXwn9XWMeXhyBxJ2m5L6LK9l8I4sfJqsUiaEuEqwBZ+9ZfVF8kdBw2EY
	Zl9JuN11LutclHBYSeHDDYKj/iKlKXGPnGELlzXhIHnhzpF3CaP/qsEA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gfct9cxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 08 Sep 2024 16:40:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 488G0fdB040755
	for <dtrace@lists.linux.dev>; Sun, 8 Sep 2024 16:40:23 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41gd97q3gm-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 08 Sep 2024 16:40:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TIXFlLiNs5cXKn8G6jlyFB+bsemlzUW1B+y6PeyeED3QqV2vk7jmBcDXjUHw7u4szre2YjRoJOeIThXOpN+feRPJq7n2spV2BSWpiF3stu4ylX9EG9JsEDSgY7LiRWCUG0v5yPMSyXKh6zsJ57OFnn42c9fglPq+GqjHHNN1FfwO2FxVpQCzOM/3BEMeGkTDcm9s46K6FSL5F3cpbpf84cghoVALXCxamnicapQMTxXKm2/sPSsTyNw+E6kGpCvFl5uzi6U5uZ0Ly3+8N0fopwjPJRLSeARLPrsJZ6tYlwKpj5kQK0X5lsWgNHbugmk76PszWZK2Hx36GXdbYUUMPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByX1phWj+2RwHDAiNDXyF7BC/9avrm6UWdDtm+9FHNQ=;
 b=vFSpiBvbLQjLH8pgGkLKlbl9iFKsuyyaESllM8XJyQtC9FdWiA0WlkTBG8yV96EYoFEH5w7xzdGfv7E9DVErI1EnZdEcB9jsbae34qRcgkhwvZ+9qGEXvMQCPM/p/NJdgaUoA0qhi46aJqQChO/UDfcJZMQDG1C6y+vuE4KUXLNRkODgYVVjSgMDlwNlywVwq2gg3p01plgBJNl8KL41R1CLCNZqv7I/IZJeEe1z+MO4WthqP+JJvnSacDuLhpCUBVH0yEk/V0f1j3c+OQBKkGUeGEqc9QAxwcavgMp9nF7ZMXTl4Jsduae32nv56bwnoov3GbGkci/8jRCcmmO2Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByX1phWj+2RwHDAiNDXyF7BC/9avrm6UWdDtm+9FHNQ=;
 b=rDop1lXPdmFHVDYKq6vBoSFPwSyGfCml3Guf48E2tJEUlHl8KK5SsD1iyk1Mq9t3J/BNW8JJ/nnyoClYcf4bGLG26zBoaEOqNiSV/pw0ilmxr4tuNHscz9uzrHMFopOInNGAIBb7ERzmxb9qO5cr2IT4HKisdtLyZNIl8VLbYdE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH3PR10MB7779.namprd10.prod.outlook.com (2603:10b6:610:1af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Sun, 8 Sep
 2024 16:40:19 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7939.010; Sun, 8 Sep 2024
 16:40:19 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 07/19] Create the BPF usdt_prids map
Date: Sun,  8 Sep 2024 12:40:15 -0400
Message-Id: <20240908164016.3820-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240908164016.3820-1-eugene.loh@oracle.com>
References: <20240908164016.3820-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0059.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::34) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH3PR10MB7779:EE_
X-MS-Office365-Filtering-Correlation-Id: aacf909c-2c31-4376-b5b2-08dcd024ed1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QsolCkdRC/qmv1WZR/AKVJ//7d3xAnet6YcavsnZzNQMySKHQf/FVoEvg7fZ?=
 =?us-ascii?Q?y8alCsRCp7/wPOzOP8yOuYfjl0qoNmR/KF/c1gzoZ0hqU5ioEPyPGaC6FpWZ?=
 =?us-ascii?Q?7fPFGSd7Ji4PmlQcEg/Xf9GoUoeH35xW0RbMk226FXW2JbWdAeBMqbBycSXB?=
 =?us-ascii?Q?IxkJg2dLVDOGH/1kYFbZ0g6CUcS59Sy7zuSSxhzDvNk0/5CDew7dKX4cEiU1?=
 =?us-ascii?Q?1oLXzkx2ENlrPBVYY5+feEIYDYk9KVlg8QYQkUzpdpSkAu9Qo/5g8aepavrR?=
 =?us-ascii?Q?CgmXuGupBUdDODEFgaR15J2SEA4zIO5ilrBueJPwiJUg+92hud0br5k58ERq?=
 =?us-ascii?Q?N+VdbEjeu3ZoIlWEhp+KI84b2tzW5QfQ2XGbg6hCXnWzWg/Z8qrofvUsr8Gp?=
 =?us-ascii?Q?cfw3DRHcXRl7yol5ZZ7tv2kUUWZbUCr74SzuD8ZCRNDg7kEQFT7+nWT4tnbr?=
 =?us-ascii?Q?Tu6GT5ghYNDi/zqWxgbowfJ5D0GJU0IaHV9I9dfbpyJvZsoESkMNso6PXv6Z?=
 =?us-ascii?Q?+QNB1g9QK7B8LLF1AOGFNewlqkW2nelChsiM5Ag0Bc3XnIxfblNvE29dV23o?=
 =?us-ascii?Q?50i1e4pi6U/RBtKo4fJxQoD+eFuYajiLtgkmAHJp4KCyDUa8r2esboUfr2Hd?=
 =?us-ascii?Q?AnMzHOasjeF/jQ5SabWfM6cKhyHfbPA0SkGZmaVhp71V4Is2sVZscpPisvXA?=
 =?us-ascii?Q?/qpRsqxcN3HsnZ5LKsEIpItnbuokjlqmW3SGHQjt6aZn8V6ve4tP86vj+SLa?=
 =?us-ascii?Q?m1AoMQUj1nbz6ovkJN17G3Nzo2TeNLCHt53C82x+2/knqI1nEl+WKzWDu6A/?=
 =?us-ascii?Q?M05RMyzgv/emYdsTEw0IrFW8UMNm/fddN5YobXBcdOWRRuEYMDb2NpL4/gVx?=
 =?us-ascii?Q?1n8fqGSTeTsvpOXQfFnQkRj5ZTtAO7Qz3kToa0flZKHNCcMNBhXGdFupWSz0?=
 =?us-ascii?Q?kidq1rZt3Xwuva0Zi1hufj3NQZVuG+b5AEGbl/zqYAqHMDtuw5h+rw5eW9Vk?=
 =?us-ascii?Q?a7Sq30hwWamvvA5DIRahGjsgLhSs5/4vpcySxZZ5XNv9Tm/HbIYo5W+Mnop0?=
 =?us-ascii?Q?XxAaHTRa2po30qUnpFj8m8Y7dKGHrdGQYvW6K4XYkh4lOmBo8WKemdWPc0E7?=
 =?us-ascii?Q?HkIxhKTMBlxV1UANCzGjHpEyKq531xHeF+Epgj2pwuTt4s5VrZUJ+whFFIuy?=
 =?us-ascii?Q?NMclbGwiHItroM2i4TCqJiEEreyaTH4WYacq1kbFFCoPjiFgjBnrDw26bVij?=
 =?us-ascii?Q?pNiZwen8KXHB+AzWyhwS2fh80ARzBXEEldnDKXdI/5yTyPFxdz3X/btN1OZb?=
 =?us-ascii?Q?wR7l5y+k6eHDRH4G8Cj0iE74ytgswSCw8aW2JsN4Y1qwzg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wpKV2dAFdq8VTcSAwY/guSCA2UjRWBYvI6nXtxZMaeCcE+e3Nv3BNWaXx2Fx?=
 =?us-ascii?Q?uXzpjNl0+3BLeqApnDF4ipGpKe7hQ0dS3GhUPBrY9woASsHP0JCIdlETe5jd?=
 =?us-ascii?Q?ZHAwilwJuPLXMXNsUgZEdBB06dGO7Fj1buliLCgsprk30lcLmL2/C/S5hpnG?=
 =?us-ascii?Q?dC6g48KIrPgO8oj78CX+8UQCEMZHwOMh4v3WbDDjtfJuWLxFGVJblbf4j8wN?=
 =?us-ascii?Q?0ZLe2Upgdr6zo31YWGV6QJv8cn1GEy4XAo4APDyZXPsYvPR9RhhAPRasSKmN?=
 =?us-ascii?Q?OL2dEnc3TBZkUVjpYqnWoXlAQnPoOZbhVgo3mCHmoe9MasoJVZthw0pmzz9F?=
 =?us-ascii?Q?JHJwH9n1cod9E8xddY6AUgBvjug+tYyy77aGkAxIiNMbjnXys+jlZG/vsSDE?=
 =?us-ascii?Q?e1kQHtdSyDmsJff1tSM9uPwVOotgP1h9jlefyVNRNefjkmonoQK0CFx99K4i?=
 =?us-ascii?Q?oIqtU+FFD3/Bu/BKQoVgh67GA7Q0vFqQy/6SF8w9tl4MVoqP/pAMJOsJZ370?=
 =?us-ascii?Q?m2zmzb2aDG3ny+MQImqK1rZl9muuvnAFnTOnxVgjmPPsFaJ7EQPl8P5b2GHJ?=
 =?us-ascii?Q?X8KuVVq8w+TSk6P1puI2WtwhCaAlsEJzgjc/P5XmlPzclrh4tlZFnlYDYcN/?=
 =?us-ascii?Q?iuGAPMMAVjsMtrurzygDRKsU0SidqiDi5ABiV5yPUSyIRh6867oIVzdwlgTb?=
 =?us-ascii?Q?xiwtR1ZS6VVkMpaERmbYiHwU6H5z2JKCsMwxQJzCKBMCPOszhmVElA2mNmPA?=
 =?us-ascii?Q?oCI0hb0vi9W+9geTL3BElvXPlUd/4nw9ILCadaVNSdZzldhJ5sVRvqLsI7Rf?=
 =?us-ascii?Q?qegvMN2IXDPMQyNZXIhp7TUIAa8RAQ5MS8uFTxWrXaXAWd/4x0fd40Bj41Rw?=
 =?us-ascii?Q?cgAoJ627Pcg9FzXcUnD96qr/2cESmKoZPB1uS+DARHiGMVPxi0aQEYSugxnF?=
 =?us-ascii?Q?Dz5lKOasHt+sry25SiBenMUMoUvpkmH/+nbPgGmT7aNjMGbG0O40V/en7I0J?=
 =?us-ascii?Q?WjuSKagUP6unfMwXidMcU6mrKsyCWshTPiEWYe3X/5J9k8OcvPDz+VSy67di?=
 =?us-ascii?Q?S1UhBqVsz0dFaaqf5M+rKn1fSw/veQjBKLs3kZAhat9vQSXbrOl00/yWKkov?=
 =?us-ascii?Q?8nGbo3VSyXTbBeLiX/VduyDd0Cu4R9D5xeMFwcHJr6o0acSBIRDxMQtdAs2u?=
 =?us-ascii?Q?Lk3AxotNam7qsOaugyqtugHlg3fBIg6EiLZUBUPD0pM3OAjI1B81vrVw4gSQ?=
 =?us-ascii?Q?iaXgdkc4VJU1uli2TCOJnYspClcLoeuAhD6xVF2xXLmavqQ6pU41kl8rZjfL?=
 =?us-ascii?Q?PZsEs5fGCEn6UVIyAooucjJeJI856L8mfV8tTdOJ51bJ6dnfBExlnPQcEe9w?=
 =?us-ascii?Q?hqtkUYv7s0XUQI89PBUSVABtmas+ff/4lzbqe+75/wmHVyHAqMc4wP9jRjmo?=
 =?us-ascii?Q?/l3dRy2bsIdNVZztYkhALDZWa32DVgg2PzqVl0CASEI06KoubYYML97/uC5p?=
 =?us-ascii?Q?fjoHGcLnit9QrPtp84ktvQzLst5zHUw6OlIYMCRjCX+C9Ky3lFDjjadenIPf?=
 =?us-ascii?Q?UtKuiM5Vw+/QoPm1F8ilN6TiFTXyjjrmzDBaolHy?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	I9Slvz795VjIv0lU6XopPHVKvvYceFu7lG+an6rZPZlPn8Ph0ibATxsBKWKXlm9QyVxhyd2GnurEnI7wK4aXTV5f7zy0i7DoGvNocp9kiuX5jUbZZx5VoXlin2fyBRC+WB0A89pRnZ2vqXauGpATaXtkLAF4rzYSRuXFPcrpXcZRj1jYul3ISxRfi7bxdhySVc6QdoHy/P5b/xVrIX+INn8owWRCHvLtghYrlEqsLK5GSPNc7gEJzzUx2eIoBSQgI0RaA+KMZPFXktd7wfuXGqP7CzNkZEPLyqRLaO2yeJqub2Ma+Z45jtjhE2xNzVLSFEH24EJWNNSxgYf2tvptYXXR6BVdEHPXe6M/a5AlmUP3qNQYOq9l7S5wXsZUQuDV03QpLWrbsmqnjFHXi9IDqr8jO37k1oTuSXHykT7oXZC+oG3g2IomOz+biF8fP1Q8Nd8RWKgVrGTrGqEWsC4ivg1R4HtGZRaQQRfM8S6ZXzLUIu6AA5IiQsBIZIYQFYILN4RlgQzsIMVf6i99m2GkL9jI/1zW+SwpSzjuP/ciotw23ls07UBzx2IW/Z/hbbCI0HhxHxCdxqbvuiHeIoURaaCj3OJzrlKqnqkHMk6sDxw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aacf909c-2c31-4376-b5b2-08dcd024ed1e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 16:40:19.6205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9wGoAET0jIUuw4L56RbOtz6pOQXhgzT/G2zlwefe/DEiI/3p1VVndgpD/j9eY0UKH/wSktKcerGYj43jNG1I2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7779
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-08_06,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409080141
X-Proofpoint-GUID: T5BHP4O3ekWXrhH-jpYV8wLWH0UhKlNk
X-Proofpoint-ORIG-GUID: T5BHP4O3ekWXrhH-jpYV8wLWH0UhKlNk

From: Eugene Loh <eugene.loh@oracle.com>

As USDT processes come and go, the overlying probes for an underlying
probe will change.  Hence, we will move to a scheme in which an
underlying probe will walk all possible clauses it could call,
deciding at run time (using a bit mask for the overlying USDT probe)
which of the clauses to call.

In this patch, we create and update the BPF "usdt_prids" map.  This
is a hash map, where:

  *)  the key (size: dtp->dt_usdt_pridsmap_ksz) comprises
        - the PID of the firing process
        - the PRID of the underlying probe

  *)  the value (size: dtp->dt_usdt_pridsmap_vsz) comprises
        - the PRID over the overlying USDT probe
        - a bit mask indicating which clauses should be called

As processes start up, we also add new overlying USDT probes,
requiring updates of the BPF "probes" and "strtab" maps and of
the list of enablings.

The underlying-probes "update" function is called sporadically.
The focus of this patch is the function.  When it is called can
be tuned in future patches.

This patch guesses certain sizes very crudely.  These sizes should
be handled more robustly in future patches:

  *)  The allocated size of the string table.  For example,
      new provider names have to be added as new processes
      start.

  *)  The number of entries in the BPF "usdt_prids" map.
      There is a little relief here in that, as processes
      terminate, they can be removed from the map.

  *)  The size of the bit mask -- that is, the greatest
      number of clauses an underlying probe might call.
      This is relatively easy to extend;  nevertheless,
      that work is left for a future patch.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_bpf.c         |  42 +++++-
 libdtrace/dt_cc.c          |   2 +-
 libdtrace/dt_dlibs.c       |   1 +
 libdtrace/dt_impl.h        |   6 +
 libdtrace/dt_prov_uprobe.c | 266 +++++++++++++++++++++++++++++++++++++
 libdtrace/dt_work.c        |   2 +
 6 files changed, 317 insertions(+), 2 deletions(-)

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index 3f9c42ea..70803e3c 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -841,7 +841,8 @@ gmap_create_strtab(dtrace_hdl_t *dtp)
 	int		fd, rc, err;
 
 	dtp->dt_strlen = dt_strtab_size(dtp->dt_ccstab);
-	dtp->dt_rooffset = P2ROUNDUP(dtp->dt_strlen, 8);
+	dtp->dt_strmax = dtp->dt_strlen + 1000;            // FIXME pad some arbitrary amount to account for new USDT probes as new processes start
+	dtp->dt_rooffset = P2ROUNDUP(dtp->dt_strmax, 8);
 	dtp->dt_rosize = dt_rodata_size(dtp->dt_rodata);
 	dtp->dt_zerooffset = P2ROUNDUP(dtp->dt_rooffset + dtp->dt_rosize, 8);
 	dtp->dt_zerosize = 0;
@@ -899,6 +900,7 @@ gmap_create_strtab(dtrace_hdl_t *dtp)
 	if (rc == -1)
 		return dt_bpf_error(dtp, "cannot update BPF map 'strtab': %s\n",
 				    strerror(err));
+	dtp->dt_strtabmap_fd = fd;
 
 	return 0;
 }
@@ -936,6 +938,43 @@ gmap_create_probes(dtrace_hdl_t *dtp)
 				dtp, "cannot update BPF map 'probes': %s\n",
 				strerror(errno));
 	}
+	dtp->dt_probesmap_fd = fd;
+
+	return 0;
+}
+
+/*
+ * Create the 'usdt_prids' BPF map.
+ *
+ * USDT-PRID information map.  This is a global hash map for use
+ * with USDT probes.  It is indexed by (pid, underlying probe ID).
+ * The value is a probe ID for the overlying USDT probe and a bit
+ * mask indicating which clauses to execute for this pid.
+ *
+ * WIP.  Just make up some sizes for now.
+ *
+ *     How big is a probe ID?  Sometimes, it's a dtrace_id_t.
+ *     And uts/common/sys/dtrace_types.h gives us "typedef uint32_t dtrace_id_t".
+ *     Meanwhile, libdtrace/dt_impl.h has "uint32_t dt_probe_id".
+ *     So either uint32_t or dtrace_id_t is fine.
+ *
+ *     How big should our bit mask be?  Start with 8*sizeof(long long) bits.
+ *
+ *     How many entries should we allow?  Start with 1000.
+ *
+ * Note that for a given (pid, PRID) key, there can be at most one
+ * overlying USDT probe.
+ */
+static int
+gmap_create_usdt_prids(dtrace_hdl_t *dtp)
+{
+	dtp->dt_usdt_pridsmap_fd = create_gmap(dtp, "usdt_prids", BPF_MAP_TYPE_HASH,
+			 dtp->dt_usdt_pridsmap_ksz, dtp->dt_usdt_pridsmap_vsz, 1000);
+	if (dtp->dt_usdt_pridsmap_fd == -1)
+		return -1;
+
+	/* Populate the newly created map.  FIXME:  this is probably not the right place for this. */
+	dt_uprobe.update(dtp, NULL);
 
 	return 0;
 }
@@ -1045,6 +1084,7 @@ dt_bpf_gmap_create(dtrace_hdl_t *dtp)
 	CREATE_MAP(scratchmem)
 	CREATE_MAP(strtab)
 	CREATE_MAP(probes)
+	CREATE_MAP(usdt_prids)
 	CREATE_MAP(gvars)
 	CREATE_MAP(lvars)
 	CREATE_MAP(dvars)
diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
index b28388e9..e7f22206 100644
--- a/libdtrace/dt_cc.c
+++ b/libdtrace/dt_cc.c
@@ -1046,7 +1046,7 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 				nrp->dofr_data = 0;	/* FIXME */
 				continue;
 			case DT_CONST_STBSZ:
-				nrp->dofr_data = dtp->dt_strlen;
+				nrp->dofr_data = dtp->dt_strmax;
 				continue;
 			case DT_CONST_STRSZ:
 				nrp->dofr_data =
diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
index ba4d4abe..924cf11e 100644
--- a/libdtrace/dt_dlibs.c
+++ b/libdtrace/dt_dlibs.c
@@ -66,6 +66,7 @@ static const dt_ident_t		dt_bpf_symbols[] = {
 	DT_BPF_SYMBOL(lvars, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(mem, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(probes, DT_IDENT_PTR),
+	DT_BPF_SYMBOL(usdt_prids, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(scratchmem, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(specs, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(state, DT_IDENT_PTR),
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index c0399a06..6704cfc7 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -287,6 +287,7 @@ struct dtrace_hdl {
 	dt_strtab_t *dt_ccstab;	/* global string table (during compilation) */
 	dt_rodata_t *dt_rodata;	/* global read-only data */
 	uint_t dt_strlen;	/* global string table (runtime) size */
+	uint_t dt_strmax;	/* global string table (runtime) size, allocated */
 	uint_t dt_rooffset;	/* read-only data offset */
 	uint_t dt_rosize;	/* read-only data size */
 	uint_t dt_zerooffset;	/* zero region, offset */
@@ -394,6 +395,11 @@ struct dtrace_hdl {
 	int dt_aggmap_fd;	/* file descriptor for the 'aggs' BPF map */
 	int dt_genmap_fd;	/* file descriptor for the 'agggen' BPF map */
 	int dt_cpumap_fd;	/* file descriptor for the 'cpuinfo' BPF map */
+	int dt_strtabmap_fd;	/* file descriptor for the 'strtab' BPF map */
+	int dt_probesmap_fd;	/* file descriptor for the 'probes' BPF map */
+	int dt_usdt_pridsmap_fd; /* file descriptor for the 'usdt_prids' BPF map */
+	int dt_usdt_pridsmap_ksz; /* 'usdt_prids' BPF map key size */
+	int dt_usdt_pridsmap_vsz; /* 'usdt_prids' BPF map value size */
 	dtrace_handle_err_f *dt_errhdlr; /* error handler, if any */
 	void *dt_errarg;	/* error handler argument */
 	dtrace_handle_drop_f *dt_drophdlr; /* drop handler, if any */
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index cbde6a48..d53a1c8d 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -37,8 +37,10 @@
 #include "dt_list.h"
 #include "dt_provider_tp.h"
 #include "dt_probe.h"
+#include "dt_program.h"
 #include "dt_pid.h"
 #include "dt_string.h"
+#include "port.h"
 
 /* Provider name for the underlying probes. */
 static const char	prvname[] = "uprobe";
@@ -63,6 +65,15 @@ typedef struct list_probe {
 	dt_probe_t	*probe;
 } list_probe_t;
 
+typedef struct usdt_prids_map_key {
+	pid_t		pid;
+	dtrace_id_t	uprid;
+} usdt_prids_map_key_t;
+typedef struct usdt_prids_map_val {
+	dtrace_id_t	prid;
+	long long	mask;
+} usdt_prids_map_val_t;
+
 static const dtrace_pattr_t	pattr = {
 { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_ISA },
 { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
@@ -77,6 +88,9 @@ dt_provimpl_t	dt_usdt;
 
 static int populate(dtrace_hdl_t *dtp)
 {
+	dtp->dt_usdt_pridsmap_ksz = sizeof(usdt_prids_map_key_t);
+	dtp->dt_usdt_pridsmap_vsz = sizeof(usdt_prids_map_val_t);
+
 	if (dt_provider_create(dtp, dt_uprobe.name, &dt_uprobe, &pattr,
 			       NULL) == NULL ||
 	    dt_provider_create(dtp, dt_uprobe_is_enabled.name,
@@ -123,6 +137,257 @@ static void probe_destroy(dtrace_hdl_t *dtp, void *datap)
 	free_probe_list(dtp, datap);
 }
 
+/*
+ * Clean up the BPF "usdt_prids" map.
+ */
+static int
+purge_BPFmap(dtrace_hdl_t *dtp)
+{
+	int			fd = dtp->dt_usdt_pridsmap_fd;
+	usdt_prids_map_key_t	key, nxt;
+	usdt_prids_map_val_t	val;
+
+	/* Initialize key to a pid/uprid that cannot be found. */
+	key.pid = 0;
+	key.uprid = 0;
+
+	/* Loop over all entries. */
+	while (dt_bpf_map_next_key(fd, &key, &nxt) == 0) {
+		memcpy(&key, &nxt, sizeof(usdt_prids_map_key_t));
+
+		if (dt_bpf_map_lookup(fd, &key, &val) == -1)
+			return dt_set_errno(dtp, EDT_BPF);
+
+		/* Check if the process is still running. */
+		if (!Pexists(key.pid)) {
+			dt_bpf_map_delete(fd, &key);          // FIXME:  bpf_map_next_key() iteration restarts each time we delete an elem!!!
+			continue;
+		}
+
+		/*
+		 * FIXME.  There might be another case, where the process
+		 * is still running, but some of its USDT probes are gone?
+		 * So maybe we have to check for the existence of one of
+		 *     dtrace_probedesc_t *pdp = dtp->dt_probes[val.prid]->desc;
+		 *     char *prv = ...pdp->prv minus the numerial part;
+		 *
+		 *     /run/dtrace/probes/$pid/$pdp->prv/$pdp->mod/$pdp->fun/$pdp->prb
+		 *     /run/dtrace/stash/dof-pid/$pid/0/parsed/$prv:$pdp->mod:$pdp->fun:$pdp->prb
+		 *     /run/dtrace/stash/dof-pid/$pid/.../parsed/$prv:$pdp->mod:$pdp->fun:$pdp->prb
+		 */
+	}
+
+	return 0;
+}
+
+/*
+ * Grow the string table map.  It includes the string table (which might
+ * grow due to new USDT probes).  It also includes the read-only data and
+ * the block of zeros, but these remain fixed.
+ *
+ * FIXME Is there a danger of the BPF map update colliding with map reads?
+ */
+static int
+grow_strtab(dtrace_hdl_t *dtp)
+{
+	size_t		sz = dtp->dt_zerooffset + dtp->dt_zerosize;
+	char		*strtab;
+	uint8_t		*buf, *end;
+	size_t		strsize = dtp->dt_options[DTRACEOPT_STRSIZE];
+	uint32_t	key = 0;
+	int		rc, err;
+
+	strtab = dt_zalloc(dtp, sz);
+#if 0
+	// FIXME do something
+	if (strtab == NULL)
+		return dt_set_errno(dtp, EDT_NOMEM);
+#endif
+
+	/* Copy the string table data. */
+	dt_strtab_write(dtp->dt_ccstab, (dt_strtab_write_f *)dt_strtab_copystr, strtab);
+
+	/* Loop over the string table and truncate strings that are too long. */
+	buf = (uint8_t *)strtab;
+	end = buf + dtp->dt_strlen;
+	while (buf < end) {
+		uint_t	len = strlen((char *)buf);
+
+		if (len > strsize)
+			buf[strsize] = '\0';
+
+		buf += len + 1;
+	}
+
+	/* Copy the read-only data. */
+	dt_rodata_write(dtp->dt_rodata, (dt_rodata_copy_f *)dt_rodata_copy, strtab + dtp->dt_rooffset);
+
+	rc = dt_bpf_map_update(dtp->dt_strtabmap_fd, &key, strtab);
+	err = errno;
+	dt_free(dtp, strtab);
+
+	// FIXME do something
+	if (rc == -1) {
+		strerror(err);
+		return -1;
+		// return dt_bpf_error(dtp, "cannot update BPF map 'strtab': %s\n", strerror(err));
+	}
+
+	return 0;
+}
+
+/*
+ * Update the uprobe provider.
+ */
+static void update_uprobe(dtrace_hdl_t *dtp, void *datap)
+{
+	dt_probe_t	*prp;
+	dt_probe_t	*prp_next;
+	int		i, prid = dtp->dt_probe_id;
+	uint_t		old_strlen = dtp->dt_strlen;
+	dt_pcb_t	pcb;
+
+	/* Clear stale pids. */
+	purge_BPFmap(dtp);
+
+	/* Update dt_probes[] and dt_enablings. */
+	/*
+	 * pcb is only used inside of dt_pid_error() to get:
+	 *     pcb->pcb_region
+	 *     pcb->pcb_filetag
+	 *     pcb->pcb_fileptr
+	 * While pcb cannot be NULL, these other things apparently can be.
+	 */
+	memset(&pcb, 0, sizeof(dt_pcb_t));
+	for (i = 0; i < dtp->dt_stmt_nextid; i++)
+		dt_pid_create_probes(&dtp->dt_stmts[i]->dtsd_ecbdesc->dted_probe, dtp, &pcb, 1);
+
+	while (prid < dtp->dt_probe_id) {
+		dt_bpf_probe_t pinfo;
+		const dtrace_probedesc_t *pdp = dtp->dt_probes[prid]->desc;
+		int fd = dtp->dt_probesmap_fd;
+
+		dt_probe_enable(dtp, dtp->dt_probes[prid]);
+
+		pinfo.prv = dt_strtab_index(dtp->dt_ccstab, pdp->prv);
+		pinfo.mod = dt_strtab_index(dtp->dt_ccstab, pdp->mod);
+		pinfo.fun = dt_strtab_index(dtp->dt_ccstab, pdp->fun);
+		pinfo.prb = dt_strtab_index(dtp->dt_ccstab, pdp->prb);
+
+		if (dt_bpf_map_update(fd, &pdp->id, &pinfo) == -1)
+			assert(0);   // FIXME do something here
+
+		prid++;
+	}
+
+	/* Grow the strtab if it has gotten bigger. */
+	dtp->dt_strlen = dt_strtab_size(dtp->dt_ccstab);
+
+	if (dtp->dt_strlen > dtp->dt_strmax)
+		assert(0);               // FIXME handle this more gracefully
+	if (dtp->dt_strlen > old_strlen)
+		grow_strtab(dtp);
+
+	/* Review enablings. */
+	for (prp = dt_list_next(&dtp->dt_enablings); prp != NULL; prp = prp_next) {
+		pid_t		pid;
+		list_probe_t	*pup;
+
+		prp_next = dt_list_next(prp);
+
+		/* Make sure it is an overlying USDT probe. */
+		if (prp->prov->impl != &dt_usdt)
+			continue;
+
+		/* FIXME passing in NULL pcb and dpr wreaks havoc on error reporting? */
+		/*
+		 * Nick writes:
+		 * This is a general problem with running compiler-adjacent things outside
+		 * compile time. I think we should adjust dt_pid_error() so that it works
+		 * with NULL pcb and dpr at once, probably by using the code path for
+		 * pcb != NULL and augmenting it so that it passes in NULL for the region and
+		 * filename args and 0 for the lineno if pcb is NULL. (dt_set_errmsg can
+		 * already handle this case.)
+		 */
+		pid = dt_pid_get_pid(prp->desc, dtp, NULL, NULL);
+
+		if (!Pexists(pid)) {
+			/* Remove from enablings. */
+			dt_list_delete(&dtp->dt_enablings, prp);
+
+			/* Make it evident from the probe that it is not in enablings. */
+			((dt_list_t *)prp)->dl_prev = NULL;
+			((dt_list_t *)prp)->dl_next = NULL;
+
+			/* Free up its list of underlying probes. */
+			while ((pup = dt_list_next(prp->prv_data)) != NULL) {
+				dt_list_delete(prp->prv_data, pup);
+				dt_free(dtp, pup);
+			}
+			dt_free(dtp, prp->prv_data);
+			prp->prv_data = NULL;
+
+			/* Free up BPF "probes" map entry. */
+			dt_bpf_map_delete(dtp->dt_probesmap_fd, &prp->desc->id);
+
+			continue;
+		}
+
+		for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
+			dt_probe_t		*uprp = pup->probe;
+			long long		mask = 0, bit = 1;
+			usdt_prids_map_key_t	key;
+			usdt_prids_map_val_t	val, oval;
+			dt_uprobe_t		*upp = uprp->prv_data;
+
+			/*
+			 * For is-enabled probes, the bit mask does not matter.
+			 * It is possible that we have this underlying probe due to
+			 * an overlying pid-offset probe and that we will not know
+			 * until later, when some new pid is created, that we also
+			 * have an overlying USDT is-enabled probe, but missing this
+			 * optimization opportunity is okay.
+			 */
+			if (uprp->prov->impl == &dt_uprobe && !(upp->flags & PP_IS_ENABLED)) {
+				int n;
+
+				for (n = 0; n < dtp->dt_stmt_nextid; n++) {
+					if (dt_gmatch(prp->desc->prv, dtp->dt_stmts[n]->dtsd_ecbdesc->dted_probe.prv) &&
+					    dt_gmatch(prp->desc->mod, dtp->dt_stmts[n]->dtsd_ecbdesc->dted_probe.mod) &&
+					    dt_gmatch(prp->desc->fun, dtp->dt_stmts[n]->dtsd_ecbdesc->dted_probe.fun) &&
+					    dt_gmatch(prp->desc->prb, dtp->dt_stmts[n]->dtsd_ecbdesc->dted_probe.prb))
+						mask |= bit;
+
+					bit <<= 1;
+				}
+			}
+
+			key.pid = pid;
+			key.uprid = uprp->desc->id;
+
+			val.prid = prp->desc->id;
+			val.mask = mask;
+
+			/* linux/bpf.h says error is -1, but it could be -2 */
+			if (dt_bpf_map_lookup(dtp->dt_usdt_pridsmap_fd, &key, &oval) < 0) {
+				/*
+				 * Set the map entry.
+				 */
+				// FIXME Check return value, but how should errors be handled?
+				dt_bpf_map_update(dtp->dt_usdt_pridsmap_fd, &key, &val);
+			} else if (val.prid != oval.prid || val.mask != oval.mask) {
+				/*
+				 * This can happen when two overlying probes map to the same underlying probe for the same pid.
+				 * E.g., pid:::entry and pid:::0, or pid:::$offset and usdt:::.
+				 */
+			} else {
+				/*
+				 * Nothing to do, it already is in the map.
+				 */
+			}
+		}
+	}
+}
 
 /*
  * Look up or create an underlying (real) probe, corresponding directly to a
@@ -782,6 +1047,7 @@ dt_provimpl_t	dt_uprobe = {
 	.probe_info	= &probe_info,
 	.detach		= &detach,
 	.probe_destroy	= &probe_destroy_underlying,
+	.update		= &update_uprobe,
 };
 
 /*
diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
index 599e2ae3..79da46fa 100644
--- a/libdtrace/dt_work.c
+++ b/libdtrace/dt_work.c
@@ -373,6 +373,8 @@ dtrace_work(dtrace_hdl_t *dtp, FILE *fp, dtrace_consume_probe_f *pfunc,
 	dtrace_workstatus_t	rval;
 	int			gen;
 
+dt_uprobe.update(dtp, NULL);
+
 	switch (dtrace_status(dtp)) {
 	case DTRACE_STATUS_EXITED:
 	case DTRACE_STATUS_STOPPED:
-- 
2.43.5

