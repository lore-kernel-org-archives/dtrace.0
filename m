Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C9B1E0B87
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730150301; cv=fail; b=IKKIDsoisb/SUm0D8KNoybkuXh5kj0YdNJ637yxUyNqTJQD6KxXbR3e2+2IuqKheWmEHH4WtifoQNVKQ8In2c6k349Ry4CREI7dx1/Amuu3o7FY13hCVy3UsULyH3SK5dgH3hOt90qaVUL9ACW/TaLjeCoot+aqcJgoRXM6ZEFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730150301; c=relaxed/simple;
	bh=wIFib7fxiTYj7/xvbZ8l3q11Ew10qxVBAzytD+Nq8gQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UlLRLM22+bbbhExm/PGDBSPNAvN1frbOnglmb5NIRJyIovPJn8kTmUpneO36jwgziEXsAmNxaiX4lKiA1Bg1dkZHst/qY609SMPTmJsFiXkUhQonLu3cuybAkiEv6EtUMqHsz8JSbwuqBI24vUYnjPzA5XS2VMyTD/jL8oZvbqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=T3NNkchn; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mxKesvVE; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="T3NNkchn";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mxKesvVE"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKtaPD020939;
	Mon, 28 Oct 2024 21:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=mam4aNsmZtLdM25JN96a72ONcBQ3FIl/wmDuEdGz4Ss=; b=
	T3NNkchnwYSo/2TsyooOK0CClnZypo2hVQsJnjTlF99wccAkWBiGWS5fdWJJAmaa
	NMo9E5NSx1OR5Ir7T+jy1bqZlw6Um+eiiA8fbbB/XDQJiR9vNuofmNq5qVo0Ft6x
	jDrhr9F253HgzC5AfsmgzEtYihPiQGwX30AAU/j10NitnaGnxOpAj/n/Bz/EItmA
	VeOutAaODvhM1F4uRxO9YjZNJu2CND5FSvIqqad71os8vP60Va+ivicd044xUg0c
	0XMWfeg2pBhaTJ8mNX75Qj1QMkLqrdbLZUDI7h9wvw9tQk/BzOA5tV7kOiCiSuDe
	m+MqS6CQvBRT200pSx5hQQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdp3yx6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 21:18:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKgdcL040770;
	Mon, 28 Oct 2024 21:18:15 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hnan360u-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 21:18:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQOEGRS99huVL4q20s8MaumW7pyp0PwAqvro9uGEdgp3Cptz7eoEfEtXn2/AJ4uYm6lRjtqwXhNVlu7IpSlbZNjIKpbLekmMpNzSKiJUy3+9HjziDJl8wgliympYwPlO+w4++GNcQH6wHUr2Y11RqRPZuEafioZ/l9g9kBJJpYzhVvFCG49C8/IP/XI4gl5o0RTSFGfxAAdHwkv/MuWikXiJpp8Ud/r5+Z2x8lZRSCNxgLnhPzPTLUaLuDDAJYoBy0KtmtdFJ5eXH+uJdHdHVMsX42YoBDux2OPbh+lGt378kx3qxoPauxwdneWR9kcnYvU/f9mLSppgYUvNZ3lBUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mam4aNsmZtLdM25JN96a72ONcBQ3FIl/wmDuEdGz4Ss=;
 b=dkhQrfTmoiqwrTzHK0z00MFbpoXqd1Cx8sFqoSUI/hN6NPS1pwB1xgp8jgpAauEkRtAhjXovgrDfccEoPYDz0C5M/yibEsEJi1RbYhFLA2v8MyHq8II1Mv0JaWz7Us1finP5zCAHXe0rEVDBTEWvwAaz69EZVRXnwvcdrSaceZVmVEGXo+bxPgA4WI6Pw4/8xHE3cxTAeTpZgByU7mY0IwhaS5f08v91TnUIUfunHs6f6uHyNIVL6+VJL2b4CeWe/2uecUOhDpPaK71nxzaO2CD0nJ/ESwdOQXsQQLV70wTH+npGYvXnIjLe1mVpEJFkQCF6KCKmNz9xz4flYFmSPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mam4aNsmZtLdM25JN96a72ONcBQ3FIl/wmDuEdGz4Ss=;
 b=mxKesvVEzBQ1y+9RahYbehEs6GHAH9uo415SLTcBMekVYvBifGxO7x9Mn3FbMXUi5YvD14K4O5ATUM7cFnTm2w31lRF7MpoxOxW/gq9I3ms4g3Z7rkkVmLIw57p8sqoOPoNh1y6gSuE66ycvS0o1f2Phfeqjlbj/UWYY236eLnE=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CH3PR10MB7354.namprd10.prod.outlook.com (2603:10b6:610:12f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 21:18:13 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Mon, 28 Oct 2024
 21:18:13 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: sam@gentoo.org
Subject: [PATCH v2 03/14] configure, build: make valgrind optional
Date: Mon, 28 Oct 2024 21:17:52 +0000
Message-ID: <20241028211803.458685-4-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241028211803.458685-1-nick.alcock@oracle.com>
References: <20241028211803.458685-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0196.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::21) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CH3PR10MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: f9cd92ad-f403-4766-8c71-08dcf79607e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/4UzMPa6SKcnpL3+0Dv5V58FiZhRuL7K9RWYVL6wPCVTGVY7pV7RWXFeyi6q?=
 =?us-ascii?Q?o1Jk7B1QqSF5YQv9WbDN+oIjk6xUcRZSRxU9w+cBcTq5CMBOfyV/eq2F5zHK?=
 =?us-ascii?Q?Kz0rG9vXGnqjHl9MXAzINLssQ9PDXX9gNBF8H+1CW2xYK9Qy94tQjHYHzVRu?=
 =?us-ascii?Q?FXIHhKyNVl9M4XwFCIccGVrWRrbE1HsooxslR0umreSh77DTfwPkQud0F8fM?=
 =?us-ascii?Q?lTgzEAtXKTSniG69Y7sLcRofDQLXPjLjrtqHWRxFdezmuyw6re1hHe5J9Mhg?=
 =?us-ascii?Q?JRq/oKqiJ7EFTuGTEZqJ7ZdXoCiBN3b4cdwwTBgrN+j5u54qA5nj4LG2B2ft?=
 =?us-ascii?Q?mKYkpGJmQjJZau8O5F7DwS8jRNXtg5XbypaAWBrKFjkfgEdE6rmxSPPqIBMF?=
 =?us-ascii?Q?NsE6WeDhby9jAN7+g2lSCdXmiUBUSRQ0lch2eGoUBlFfxv2Ren8J0mf6STH1?=
 =?us-ascii?Q?J7XMzNiY7QVy+vOBc50HdT0XM1Uc7VFICibHeCBA+pK9qZc/gby9LmCwj9fr?=
 =?us-ascii?Q?I5aGNNtukJEe8reDcpfP77wnQr+nl5pQd+jI+2rrXXuKoQt6H40VOqrWnwF6?=
 =?us-ascii?Q?4uxf/LbnASjmGD/E8CYUZ3gXddY/2mranNllLoHZA6/OwZaMMVYHhX9t8wQz?=
 =?us-ascii?Q?SsSi3Jx3PpBIttImlb16WrBtOC2yn5ZaV7o6icLAYvI50U3d2GZtw8c8vhOS?=
 =?us-ascii?Q?IFK+l/EoJ9qiDGXBi7etq8ahgxNQAnVQjKQNBJUbHpAtlfQ+qvV+gr+18rIM?=
 =?us-ascii?Q?Emom2MLNsHnSPhthtigzyAcepo79BlbEihsVPniZ0ym1QRoCdM8snMsz2CcM?=
 =?us-ascii?Q?UrgeLfx6X/ZaQascAtJT/uoPm7/2x/Ls9z4D9gWAs80oe56/ditAAOozYvpp?=
 =?us-ascii?Q?sZvbVVMJMwF9uCP5/kyFjFRww8fLKa3Z2HuNllZmAcjxPxc1XXkBvjdVgJeW?=
 =?us-ascii?Q?4uKMDSs0dJKB5M1DgDNb5fNZBJZcAy9Hi3LbfJuIU8eYDEQ57TbjA+X97Jx9?=
 =?us-ascii?Q?2gUUn3eUBv4oH9HJ4ANmrLTqLM6OuNRdsn/iecIh2SgZG+jkl9xZVr0SVOnI?=
 =?us-ascii?Q?IroFIrEGNxJYcHhznAVuVwf0Cr1eflLoJQ2/Nd5qs6ghxg4qMaeyTpAy2UwT?=
 =?us-ascii?Q?ODY2cm6vCtwsPOGF1hEZIgGLb/H3QQPXyf3ZC/2+68v9qgBjZyfZZzCJ6j3E?=
 =?us-ascii?Q?t7xWXQD5/b0Tl8BHep1lGzrRFJi63ExjijFE5bjXWU1mPkdf5G51kRFzvM2D?=
 =?us-ascii?Q?6Y/+SoQlEeeMzDdk/ekY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M/dEmm8uOTxE1BzEgIKVjmZJH25/ubukOpkaa6nuNZ/g+e2Bug2EtbkLSdXx?=
 =?us-ascii?Q?TdAtZopzX0HkW+6b2ZzKnu1DiqX/qC6vhVPIuVa7slRyAlSXQhxsLEHm9OFA?=
 =?us-ascii?Q?VfxukMLMUM8P1BRsdqp8+oMslF6sKvwyl+OGX3QvCxu6i+dSdd7RH/gwwnZt?=
 =?us-ascii?Q?x0muYYyqdq3XCG9okPmpL/hEKfnZWQChs55JbUHU3fkHEm2lqWzj6H1BfANk?=
 =?us-ascii?Q?GrmuxIyZS6dUWLz98HvRBV1GNDsgtdTc1N+nvUUDhya3Ezeikenwndsl7Hh1?=
 =?us-ascii?Q?ZP4OTiNuwsmb+P4moqmqDwlndqLYAxS0FA914/jTdgVk65rs3Il0+itGLvOA?=
 =?us-ascii?Q?OhICoOTQacrPURcAEQ9MpFoVK6a16JlKFdOyGUhvcKtGK8ZiciJLg+rjTViv?=
 =?us-ascii?Q?g9zpvEfCqlFN/zrkuHZobwdE9teCjYJtrhgwhCYEZ99Lwm2daON+bg0Dn5Ok?=
 =?us-ascii?Q?5C9xawVTl3tdY2IjLVf7VaNpvyzkXeiOqagFIJefjvbhYuQ6iwyObeIDklYo?=
 =?us-ascii?Q?SF7eQqI6cXBpF8lUVC0KkcrFxfUVXXpcW7i6Wn7ls6xfxwvrCGp5i4fCSC2P?=
 =?us-ascii?Q?6C7z3sKaixVsAXOZG2Ca/FSoyX108/U+pg3JXAODW6vSFiMdMM5MjaJ7xlFX?=
 =?us-ascii?Q?xW6DKJKBy+unF0QEJuBoAZgcWW388s2cZ6UAeOM8PuJuEdBSC7VrhJ0whHvu?=
 =?us-ascii?Q?Eui45Ruvd1+MZPjE0VmXWi64GmscV/+pfRfh06ZhqByeOUioq8/HeBhIyG3f?=
 =?us-ascii?Q?FGcUxUcyy5Oq8mp8N4NwORE9jXXrTSQvxg2iRebTifgZKsuxxgSPs21zeo0w?=
 =?us-ascii?Q?oX+lh8Kb+Vz7cWMml+Fuagt6EKX8ILO8X2JfDDSry5OMLv5pF2v0v0bYM3rE?=
 =?us-ascii?Q?+n+g09MG4DFy+6ec2GMEDk50JQM1L6oF5UJogyYx0gqpS8EL9cr8bZlZwmFK?=
 =?us-ascii?Q?8qngLjhdnLznNA6A+DadZzTShNLItxaxspVljZDc998jzckRSTjP4k9zM2Ee?=
 =?us-ascii?Q?n16zVjcQzry6Iyftgf6ecsK9TT0MPLI33KaMBCqMzCXHz6wk78ItdRwBG2tx?=
 =?us-ascii?Q?gH/nGhJdb3Tn5qAWNDNVK+lhxUAwIkYO/cFjmaxdG8VBc7vNuIl1Z7+Dl++M?=
 =?us-ascii?Q?5W2xD0B1VuXZ7TESpylKqH6783tl4nVGFeLNK3SVhRVo2PpGMraeCoVcjolp?=
 =?us-ascii?Q?n/WYqBnGqQejhzqHAaJFHfMFbogSJBrbEyj96y4YIsfH+xFmbXiVl1f103c9?=
 =?us-ascii?Q?NgGO+mHsSrMtesLnydl+RC3S6weLsV969BcJS4SJvkVO77N1It3Nw32Rzlvy?=
 =?us-ascii?Q?FE+9UpyuGVIUrwhww0JBueXsXQTnKXBKpJ8K7jgeStD8TeCeOVPxsTpnwE1N?=
 =?us-ascii?Q?kRMS8dYHn5Hnahrjr7J8yTChZDrZKTbfLPKJJY9n0tgH5lJYh/QtvmXYz69b?=
 =?us-ascii?Q?OBBF2h0/HruSykf0DRXNDnN/ebVns+I5YqX3Yb8x+G4QSvSIELiMsjCR/9Hn?=
 =?us-ascii?Q?MxcuTAg1taTU4DwkQVcsgAhHbnNslfPmoL/o6uH5cHd42CR53FBmRC1xZddO?=
 =?us-ascii?Q?MK1A6z62rYtBgTh15hnxRRwR2Tgniqp0XSIFvD3zKfidBeuU8dlf8Y6xxR3f?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Y8k7d5K/4Ew4sLMRJaheS6jb89ycozcuBS8FYQcd4duCI2JJyCACaq0OGFmqAUU1/0wg7jBAnHg/MvkyF3rLR0fdSe1VwQKd1YrnqgbdRka+eLdcHBezCyL3AOZuxWI66yDERqtxlO7Cc0B3UVYaF09z5+DCLBY6oIfBSMpP3cytxQHGl9OiKIbBbPQAEsdyuBhvKQZk65g8m1E2iAju0kJt1puleCktkx2Xni8vd0Fl5PFsI+MX1oYNCw+WUUJrWA1ZpilYIl3IeJwjXN8VuuHEEbJjy5IbL/dK87djlwALqoWLBro0/VWYwFIU9fH1hPpZ7qlkzw9dJKc7MnctaLS63ha/jqrtdOLzswaQ9DfzA7Cgw00CHXlYYUuduzBTthDfURubc+ae2gntMCktf2wHI7Mm3EYDmGUPAu8tP6prVRqnAfq0cPziq7b6wPsWhngz73Cg69SVgh6six2aEpTckob7rNeS2BRNvsRdpGO2wpf7uNf6MFljcGVu8xnGvXWCzweQ642KrV9kvF+vIrACVodIXWsb4zzqQp4NAY0PMDYnvdnKBc1R8S7MgDEpPBhhxF8Fk9PeyV0qJt15JnYbYfJ9JhFx1avVqZvRI7M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9cd92ad-f403-4766-8c71-08dcf79607e1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 21:18:13.0103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: waSsCcdgbEvpCZnLRD5yPYeVMxOFkSRX44va3iOl26icisENIirqtbd24nxj7XNbZwPlhDZXuBGc83c0MntHnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7354
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_10,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280165
X-Proofpoint-ORIG-GUID: 3it_lk9u7xWxSxGjl9elvJXqxUVEsR69
X-Proofpoint-GUID: 3it_lk9u7xWxSxGjl9elvJXqxUVEsR69

We fail building if <valgrind/valgrind.h> is not available, which is
ridiculous given that the only reason we need it is to make valgrind go away
at suitable moments to let us drop uprobes.

A suitable new configure check (using a new check-header-macro-rule
function) lets us check for <valgrind/valgrind.h> and disable it if not
present: as usual, defining HAVE_VALGRIND or passing it to configure will
also suffice to override the check.

Bug: https://github.com/oracle/dtrace-utils/issues/80
Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 Makeconfig          | 36 ++++++++++++++++++++++++++++++++++++
 configure           |  1 +
 libdtrace/dt_work.c | 16 ++++++++++++++--
 3 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/Makeconfig b/Makeconfig
index 346078598624..752bd79b01fc 100644
--- a/Makeconfig
+++ b/Makeconfig
@@ -163,6 +163,41 @@ $(CONFIG_H): $(objdir)/.config/config.$(1).h
 $(CONFIG_MK): $(objdir)/.config/config.$(1).mk
 endef
 
+# Generate a makefile rule to check for the presence of MACRO
+# in HEADER and emit an appropriate header file fragment into a file
+# under $(objdir)/.config.
+#
+# The first argument must be suitable for a filename fragment,
+# for a makefile rule name and for a #define.
+#
+# Syntax: $(call check-header-macro-rule,name,macro,header)
+define check-header-macro-rule
+$(objdir)/.config/config.$(1).h $(objdir)/.config/config.$(1).mk: $(objdir)/.config/.dir.stamp
+	case x$(HAVE_$(1)) in \
+	xyes) echo '#define HAVE_$(1) 1' > $(objdir)/.config/config.$(1).h; \
+	     echo 'HAVE_$(1)=y' > $(objdir)/.config/config.$(1).mk;; \
+	xno) echo '/* #undef HAVE_$(1) */' > $(objdir)/.config/config.$(1).h; \
+	     echo '# HAVE_$(1) undefined' > $(objdir)/.config/config.$(1).mk;; \
+	*) if printf '#include <%s.h>\n#ifndef %s\n#error %s not found.\n#endif' "$(3)" "$(2)" "$(2)" | \
+	       $(CC) $(filter-out --coverage,$(CFLAGS) $(LDFLAGS)) -Iinclude -D_GNU_SOURCE -Werror=implicit-function-declaration -c -o /dev/null -x c - >/dev/null 2>&1; then \
+	       echo '#define HAVE_$(1) 1' > $(objdir)/.config/config.$(1).h; \
+	       echo 'HAVE_$(1)=y' > $(objdir)/.config/config.$(1).mk; \
+	   else \
+	       echo '/* #undef HAVE_$(1) */' > $(objdir)/.config/config.$(1).h; \
+	       echo '# HAVE_$(1) undefined' > $(objdir)/.config/config.$(1).mk; \
+	   fi;; \
+	*) echo "HAVE_$(1) must be yes or no, not $(HAVE_$(1))" >&2; \
+	   false;; \
+	esac
+	rm -f $(CONFIG_H)
+	rm -f $(CONFIG_MK)
+
+$(eval $(call make-override-help,HAVE_$(1), presence of preprocessor macro $(2) in $(3).h))
+
+$(CONFIG_H): $(objdir)/.config/config.$(1).h
+$(CONFIG_MK): $(objdir)/.config/config.$(1).mk
+endef
+
 # Generate a makefile rule to check for support for OPTION in BPFC and emit an
 # appropriate header file fragment into a file under $(objdir)/.config.
 #
@@ -229,6 +264,7 @@ $(eval $(call check-header-rule,DIS1,disassembler(NULL),disasm))
 $(eval $(call check-header-rule,DIS4,disassembler(0,0,0,NULL),disasm))
 $(eval $(call check-header-rule,INITDISINFO3,init_disassemble_info(NULL,NULL,NULL),disasm))
 $(eval $(call check-header-rule,INITDISINFO4,init_disassemble_info(NULL,NULL,NULL,NULL),disasm))
+$(eval $(call check-header-macro-rule,VALGRIND,VALGRIND_NON_SIMD_CALL0,valgrind/valgrind))
 $(eval $(call check-bpfc-option-rule,BPFV3,-mcpu=v3))
 $(eval $(call check-bpfc-option-rule,BPFMASM,-masm=normal))
 
diff --git a/configure b/configure
index 72eb734a8380..3237f9d23918 100755
--- a/configure
+++ b/configure
@@ -169,6 +169,7 @@ for option in "$@"; do
         HAVE_FUSE_NUMA=*) write_config_var FUSE_NUMA "$option";;
         HAVE_CLOSE_RANGE=*) write_config_var CLOSE_RANGE "$option";;
         HAVE_GETTID=*) write_config_var GETTID "$option";;
+        HAVE_VALGRIND=*) write_config_var VALGRIND "$option";;
         HAVE_BPFV3=*) write_config_var BPFV3 "$option";;
         HAVE_BPFMASM=*) write_config_var BPFMASM "$option";;
 	*) echo "Unknown option $option" >&2
diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
index 11335345a6d7..fd57b59513f1 100644
--- a/libdtrace/dt_work.c
+++ b/libdtrace/dt_work.c
@@ -13,7 +13,9 @@
 #include <port.h>
 #include <linux/perf_event.h>
 #include <sys/epoll.h>
+#ifdef HAVE_VALGRIND
 #include <valgrind/valgrind.h>
+#endif
 #include <dt_impl.h>
 #include <dt_aggregate.h>
 #include <dt_peb.h>
@@ -187,9 +189,11 @@ beginend_child(void *arg) {
 	read(args->tochild[0], &cmd, sizeof(cmd));
 	if (cmd != CMD_BEGIN)
 		exit(1);
+#ifdef HAVE_VALGRIND
 	if (RUNNING_ON_VALGRIND)
 		VALGRIND_NON_SIMD_CALL0(BEGIN_probe);
 	else
+#endif
 		BEGIN_probe();
 	cmd++;
 	write(args->frchild[1], &cmd, sizeof(cmd));
@@ -198,9 +202,11 @@ beginend_child(void *arg) {
 	read(args->tochild[0], &cmd, sizeof(cmd));
 	if (cmd != CMD_END)
 		exit(1);
+#ifdef HAVE_VALGRIND
 	if (RUNNING_ON_VALGRIND)
 		VALGRIND_NON_SIMD_CALL0(END_probe);
 	else
+#endif
 		END_probe();
 	cmd++;
 	write(args->frchild[1], &cmd, sizeof(cmd));
@@ -300,9 +306,12 @@ dtrace_go(dtrace_hdl_t *dtp, uint_t cflags)
 		}
 		if (cmd != CMD_BEGIN + 1)
 			return -1;
-	} else if (RUNNING_ON_VALGRIND)
+	}
+#ifdef HAVE_VALGRIND
+	else if (RUNNING_ON_VALGRIND)
 		VALGRIND_NON_SIMD_CALL0(BEGIN_probe);
 	else
+#endif
 		BEGIN_probe();
 
 	dtp->dt_active = 1;
@@ -344,9 +353,12 @@ dtrace_stop(dtrace_hdl_t *dtp)
 			return -1;
 		pthread_join(args->thr, NULL);
 		dt_free(dtp, args);
-	} else if (RUNNING_ON_VALGRIND)
+	}
+#ifdef HAVE_VALGRIND
+	else if (RUNNING_ON_VALGRIND)
 		VALGRIND_NON_SIMD_CALL0(END_probe);
 	else
+#endif
 		END_probe();
 
 	dtp->dt_stopped = 1;
-- 
2.46.0.278.g36e3a12567

