Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A64221F2D
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758913588; cv=fail; b=qAF9RQqGZXbO3LD59L23WdoZZtDxHITTwEbQdudtBwlzNut1Y0BDmaEcdBOY0FzB/1b7XOuUAvav6k9UcxN/KATc04eP3QWsvVpgbLcopgEyaev0LXGEkqISdWZOpUhibMh/vbOAMKPwjAySmmRLsPloBEAdUVErIBlAhVp/i4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758913588; c=relaxed/simple;
	bh=MOrC376EM8kaauVrwNDbRcSAK+iWrhpOnlYGr1hMy5Y=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T1E1hKCT+naia7+TRKFGVqfc/rWf492FBMi9UZs3boOZsbGO+OoV+SMIgyV5AnIFhvAsnevT2hx6AVNuIoabJ6hJjo0gBvRwcmDE+f6yuS9jihA7DUD4WjxiudQDTMZi7pA+fWqPPF89TKST5fmrCv+kwwD8SkZy6NmpM0+Q3tw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jThyx7T/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=m6KuSjR9; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jThyx7T/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="m6KuSjR9"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QIMsCs025227
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=TwIG7O4U4PqcKgwqXC
	N96tWFv0rtT5E0pYcRwRsvo6M=; b=jThyx7T/DoTQIPxlADAAz5LQ5D8d6DuCX6
	RJsX+duMGKFryU1ncuhWlxZLTAreXJjtYbVXSJIU3RK2LTrhuS5ncstSUonsflNZ
	La/RkeGyz1OD42jIMS2a6d4cmOcw3deYh+QlPSAhKYcH8U5Vkc8U2FhGN6K17JSx
	/9LIMoaIkJDzBZ7/Z9RE1FqipAwVCA49XwmSOz8nxyZhPKp7a2muC2nHL5KiefJb
	0kdHDOtAzRuSUA9Y9ao3WTGNpLHZ8QFY3sZwQ80WWugs8lHjgCm4RJXPiH6fznDl
	7Xg38dtJgfurHad4nQ3x/T/dX2ticxb+V4SPNXjkbuULvnF4gkNw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49dygc04ay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:23 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58QHrj3N020763
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:23 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012033.outbound.protection.outlook.com [40.107.200.33])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49dd82xnvu-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lUqKmoQRIcyIgbP90Je1PsqgyD7gwZ/tY6j/CLzeKg5IGNOgicYl7W8zEAxJyBf/0fGOV/W+23V39kxz+EHZEuIs8qv6o5WtWZKNuysD1I90Lg8ipr9b1smTTZSa7G89qpOlQsimhzrJPmhRQrC2eCO+qYCbU4v3lT3B02sHpPsYYKQf/gLaHdQzxqU7hFkAnGR1AXY/MMqNoNLeRkLz+f/tzVGrM84WxT/dw6dRsWW9qYNEh0MaUNfAuLd5U5GxTYIWjJna/J+1x0qwDmgCo1CiZBbJjLHoyZ9moW8kmw9oiq8CEvnxcqx7ntIEqQ+F6SYFrPlQ94ODtrqbl8ZBIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TwIG7O4U4PqcKgwqXCN96tWFv0rtT5E0pYcRwRsvo6M=;
 b=MzMfykWoF7QI7+rF2kpqdWawmd2POcVSIRcQlkU0FRq/gpeHy1WbA4H2OLfNCRJLvziunI5WxSbjoWXRW4RX0ppzp1WYOvbf2s5UCCNO32lL9fiOZBy4XakmiK9K6Aj4oF/vcQ2Gtfw9u8CJaXde88pvL4M3y3mmQlvak9AC4RsSfndCNXwzzImZGJlOcWkikTl8e0yOmNU9ptzTtuLXkYgPO4mz9ITGpGG0Kz6cU+PINu69WivGYOfhJ44UAK2N0d7NeGIo8vgPnqUKvRg70cIpY9rw5Bepql5m8yM4cm9y3BexC7VGnbb5pV82SUFw8mlJH20UwQ02cruiuG6NXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TwIG7O4U4PqcKgwqXCN96tWFv0rtT5E0pYcRwRsvo6M=;
 b=m6KuSjR99DCTu+zizvBB9lUPf1Dcf9rdBLAW51r+oEem8K03BRNsIJLOcZhQXOLoL5FSumqZTF+pSVj4RYcXYo0QaaQmDFR0wPKWvejf048D/d2tQV3c4Kuh87mhDDS3+rscbjejf+IN45Jtwed6BY2d2+vVLqOAR22BlQNFgAo=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by BN0PR10MB4856.namprd10.prod.outlook.com (2603:10b6:408:12b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 19:06:17 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%7]) with mapi id 15.20.9160.011; Fri, 26 Sep 2025
 19:06:17 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 12/20] doc: Fix anchor links for reference/
Date: Fri, 26 Sep 2025 15:05:49 -0400
Message-Id: <20250926190557.8485-12-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250926190557.8485-1-eugene.loh@oracle.com>
References: <20250926190557.8485-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0024.namprd10.prod.outlook.com
 (2603:10b6:a03:255::29) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|BN0PR10MB4856:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fc3860d-7f19-4057-2ee0-08ddfd2fc57e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WBoHOvV9FyDHAJdEyjTpsnPYj31W1qK0UtERq3uayCCLw1Y8sOA/OvEEpXNq?=
 =?us-ascii?Q?MaK2ncwZ2c2q1zBF11CwQFMWkvnqKnpekaBAg3WmQxJTVh4TN1DdoTbI6dSm?=
 =?us-ascii?Q?kQHAOc0NKjm0KZQBc1LMQx85aQ8byrLqdRI8w/+tVdEku90DkLPo9HGZf3jn?=
 =?us-ascii?Q?GMW9e2NSuR2mVfg7wbTdz7n5UEfS0knZvl3ACFwyxvRkPLDWk+noqbhriL2g?=
 =?us-ascii?Q?qZZ/fyhegrUxlA9h6IPPkabignpYDu7niUuDiOH5zp8URAuzrD6UXxLQZc42?=
 =?us-ascii?Q?PdHIwTpLJkPDIA68vJ1nJH+Hv7YO0ic5YVnYwc3lqNGbOTL0HflXhNg0F+Yr?=
 =?us-ascii?Q?dFxkyB6Y3x37OPPXPOhENfG1KwqyhtLO+QmE5ncDFtwgZe9ZFExwKbayXEpD?=
 =?us-ascii?Q?GAjvN+RvBoTc7Kal5l5MAHp1kv40XLktSml/SSrVVFFTviAeEQm0F5V8LmfC?=
 =?us-ascii?Q?U+tNkPZ73asdZRBA3pfrJan5aKzU7dajR4nXigg4cNfH/2x1oxBJifTyWYuv?=
 =?us-ascii?Q?57rf9/NSL1cVx1IJHdBCwIpyz9KFR7soWVEEZymDPGiGxS6tEFVhfYzRpdl3?=
 =?us-ascii?Q?9vGYAAEohMqWXZo7uJg1zUh07W2hlUDPDqlBJQG2myETBDIYrVSMGDxLY0tE?=
 =?us-ascii?Q?XR12hgqcbqH2reF2/CkV3++WHU1kZPu38idi6bqelwHUDkrrPmPD1Tn+QDPY?=
 =?us-ascii?Q?88nq5KLoIhe0DZhNSxh/Ymhz6hCKkZAcc79Zx3rQEQGjnYoH6q3PQVeF4RYV?=
 =?us-ascii?Q?QtDsDUecVdJAJ9ZaviQ3fpxxiL6/vOlx7sWpOZrKfbrt2PgQlul/+dIRqbp6?=
 =?us-ascii?Q?kXAum5Uj2KSSSVDd08agIZIv5ra5n6zs4KMRq1ONcBuf6l4UuyzJz8J1GSD2?=
 =?us-ascii?Q?gnT2DOVEmrogWujW4DhQxErvK2Nuu8wtLiOcKHJbECQJ6Uf0uyKwzreN/Dr2?=
 =?us-ascii?Q?RqzI2UnQ0jeZ693Fn+p1Ljfb7cj9kbBL6SYMd9Hb5kL/vphtTL3vqEXbWEgh?=
 =?us-ascii?Q?FGRCJJ7vKxoyN8wlK6cygiP18CX+yaDW8XtmIj25A0V7zc4rmKHo5sPsVp5R?=
 =?us-ascii?Q?bYWk3w+tbHd7qu7D8FkpUdzaLF/AD3g5V6MAAUZN1JHOyBlgS/oJuMJ66ano?=
 =?us-ascii?Q?GAsEG1oa+pzXX+mjIkR3TfPkENXXO9yoHuvwxJF5/wkZdHJUHUs/EHELYozP?=
 =?us-ascii?Q?+ee1ujEV6PEely4SFQA6O8uWqVFw+JSpeSbGNWrfxmPibO2Sa2X9gyF1Eze+?=
 =?us-ascii?Q?FwtoJ1dPDphbblns83BQToGdHKOJhE+uIfIvyLQpe1hf6TbpkWAg6yITzWVq?=
 =?us-ascii?Q?sNNULE87DlHTizDyfgQ+AXMT+F781pmXFJij1zSwloIkUmczNe8DX76dEKly?=
 =?us-ascii?Q?crBYLG4KSHFqrY9KV7vGMA/W86YqdMvqxo4V4i1ZrirCoj55Lx6hsUVAsVrW?=
 =?us-ascii?Q?dzQdENcxbGXASn9Odi+FKOVKe+QnB/jk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K7tN/yJDpptQ9JsvhxN3wu5/dt+YcRImFBj1h0g/clf1xWvcSHdyxzVNEHv6?=
 =?us-ascii?Q?Z7bTUWeIHZhh5Vg///wFaX7WCy9De+iPXAOSA+3zCPn0Qksp0rq+HIZMMGFV?=
 =?us-ascii?Q?1HLSUKHs3QmOFPZWbGH6bzYZSpiogGIUEnQUTL7W5fX5etmnePdkeQ4aHDBg?=
 =?us-ascii?Q?2+Iyw/TDRrjm8cV0AHr5XP5dMmRkB4gDzxLz4FwZvOwArCem7VqscOKqg40t?=
 =?us-ascii?Q?YRoouV+5E6TcfBIQ7+AcFZ8LSqs4MN656MHBbEH5tJxMTgvVWr3VyQ+3+Au5?=
 =?us-ascii?Q?gZgTSQAPoQ+XlaShj5jS6zPdsF8Ds+noC4o32fNBS7qjhcO2sKfdtZfuJPr0?=
 =?us-ascii?Q?6UUOPYZT9cZuk/rvuXzuSI1U1P/BViZ1lSdngzvQ2n2f/VgsOZzjCYV+E+QR?=
 =?us-ascii?Q?FEZBhpusFoMNSJ0sZWDB5urr1Nc7mdGXOJYlZ2mFSffkD/GTJkr6VtALJeKy?=
 =?us-ascii?Q?3y0peR0QcaKJD5FLHPZxrEL+MEjuwMqnS0OD/2C6bnwFZbc9Z5pHPRLjwU6D?=
 =?us-ascii?Q?AXSrYWF7JeMhbrGulwyEWtM2aQJL+AR78mOtqJ7vAeegiFO2N5BBj1K4vpmF?=
 =?us-ascii?Q?qBsdjfQ4We/DIThcBUspXkKS9KHFGiJljrih3yJAVv0MM0aSMnp/i2uzSAPy?=
 =?us-ascii?Q?z7tDdWwaW/zt8RXWa6H+6hbqnBsz73Vu2It3khxP2gcW/YwepXZCO9Hms+01?=
 =?us-ascii?Q?fwyDoNFkWDbGtlPNDpjJAOKwY5NxqrUYqomkIibgO0wrNPx39lFEgWf1GnMk?=
 =?us-ascii?Q?TgiSt/Vak4yGE1MP5jD7v1oNwWrOnfrO7RBgAR23ps6LKhKmLBgRzAuHoyqT?=
 =?us-ascii?Q?S+nBi0Kw0ObxXxSO+E8dHeJXFEUhiVXEIhmzZ5VMfWsA6t+NjgImUypBCr3K?=
 =?us-ascii?Q?uJCgNLw9+buP25Bc0ef8jtKG/Yqhd0wRr+8eqXISTQVsHKUiU7UP+rEgszUL?=
 =?us-ascii?Q?mpTk6tPKfNIYI6wiHPkKEiCgkr4b3DR2r5QUr8DffGfn8KIugf1bY8/WygRF?=
 =?us-ascii?Q?cadhgd6isB9nwvo13Lb5kTtTe/cc4/bdd8NPIRtylQ5Qal1k0ASFFAusVm5X?=
 =?us-ascii?Q?hyeEqe9hpd8Ow7mciVDr/0TKC+58qwOwNxcg1yUaivuV+Dtu91Dkto4EFCNi?=
 =?us-ascii?Q?Vv519YJzPHGXShogRDcb0CrV9JvTHYHNR2r8R37VKtWQFl4c6ASRsmOWj1qj?=
 =?us-ascii?Q?4ct/GKAU5VmPvstLUeZjgohOomQo8LVGoUnQ4gN21uikJtU5GyijYZPstfdq?=
 =?us-ascii?Q?BnUAXZECiXnd3nRky445ZtoWUhaVVLp/HyL83qL+S1n4RnBdcZ+AtTNrVAdo?=
 =?us-ascii?Q?37L88batMW14ETf2IxXgrD2mL1MfYW3EWEodJfhbrM8z4a9/rXwT8s/U+JdD?=
 =?us-ascii?Q?X3X7s3xkNinnab4iSC2+jHKKYr4P0cgP4I14HemFS2ZLZpcgMjpGLuXRkR60?=
 =?us-ascii?Q?ZdU4EuoElQeVpiQ8d+QMzVbzWfanJZ5+J8aNcu9C/kCRertu7U6dNawCYxEg?=
 =?us-ascii?Q?7WSxQcipl2kHvRGLuWaVFPxRKczyyynLgct+WmN9JwfAdYQPde49GRfAkR6i?=
 =?us-ascii?Q?+7zjo2W7vPJAW3Wbb59BajEomNbKrxXTjojXd3Qi?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QXJpTUOU2FTHBL3TpF3g23nd8ufQOzUjUh7Fxc+F3L//nIYapneg6geW7YlhOb5CA4dxg3j08Ro/o+NWM6uMaYH07kdBu4lS16ynZpqIhEI8aVdx2Ht6aPCvugiP/Ro3UgTqp4IAOqULQSlKdGjO79K3Om2/TGmHvjoMxhUPO3oIw4h8rvoKuxr2HxZ4SloKIiG0sx7iIyVT/FE/b9Z/WxT6wg3hlYk5UPRD6OU9BMCCXq5fKHOu5lEXEmQFI8mFj5RtKkPb/EQV6ZdrLapV5LzYGwd/omVQd9zn0PztQUA1HiaFIeI6gM+5O+6FpZ6rLl3iztTOAihbJ3gGrAsZ5ChC1shPVrA0GbmTz1EWyv6NWQdQi9H02yNzjMWw0AaP9zlI3zWAnLEVm4zaLAS+N/ENWBkjBWmfcJalO/Y5FEJK486HWifGddIXFMRi+2hwApkp1dAL749qCp6Xp4Sk2KW8CuejHH+a3+lo2QdSJXg3mgC+PkRc3r3zUr1Gy/DKEUE+RCVSuBKtkkltkzwM4qpjI1rSRJmlPfu+IsYHXMeOQ0ANOuys0JGr+4JUbLMJ+JA3uR/hxNd+b5pErXX+8I4kpjG5G23o+IwS6caYXjU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fc3860d-7f19-4057-2ee0-08ddfd2fc57e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 19:06:17.6478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /vX4ChqH2oMtDcWyUUCnIPp9yLYqEUJbSYSmQIbrkZP1GEp0y6QGrGHPzUFX85kwZjuh7Jj5cgzIyj/VRdzH1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4856
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_06,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 mlxscore=0
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2509260172
X-Proofpoint-GUID: 8Xexr9YgXpIK3hA-p8U9L6J59eYUE0wk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDE2MSBTYWx0ZWRfXxBY7L336W6iA
 zS2cpDZ1Qi6GJoJOLTo1ue1Czocv2PzJMzLjYw4dCaRybEZbNfgwfrazqf0WdZBD/cXSwObDWP9
 Nmyej9YLMP6cE86VGH0Rq8N6QEDftebBHB2BeC0uhUpM47cyK7ABEuynZ7+XULmprXOKTcf6fr5
 beKPU9fAIT/GuVhretuRXiAC9VBTO2q1btWgQzguCfkUK6aeFDMTRlOzhph5myRFLkEL9HUH5ns
 D+GZ049ie9CPoofaclUKp3awtTJM2U/rLSSmz1b/ObH5jmL3ozxsbEsQZB8uepKi9PXjfNis1/R
 GvylAFMz+ZXG68aXkPh9YrBiFHbVyU81zJwLP3iyPpLcfZWxnARD69bXnCpBHTK97MxFTYm2Jhq
 cA8Hk3NTAIh9y5O+IdJoPG1QFahRxQ==
X-Authority-Analysis: v=2.4 cv=N/Mk1m9B c=1 sm=1 tr=0 ts=68d6e430 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=s4GTXFsJzmH8gu6fbLoA:9
 a=YEhiRhN0tqYbqZft:21
X-Proofpoint-ORIG-GUID: 8Xexr9YgXpIK3hA-p8U9L6J59eYUE0wk

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 doc/userguide/index.md                        | 74 +++++++++----------
 doc/userguide/reference/aggregation.md        |  6 +-
 .../dtrace-ref-DTraceSupportforStrings.md     | 10 +--
 .../dtrace-ref-PointersandScalarArrays.md     | 12 +--
 .../reference/dtrace-ref-StructsandUnions.md  | 10 +--
 ...dtrace-ref-TypesOperatorsandExpressions.md | 34 ++++-----
 .../reference/dtrace-ref-Variables.md         |  2 +-
 7 files changed, 74 insertions(+), 74 deletions(-)

diff --git a/doc/userguide/index.md b/doc/userguide/index.md
index 72a9bf16e..f3d96a4d6 100644
--- a/doc/userguide/index.md
+++ b/doc/userguide/index.md
@@ -26,48 +26,48 @@
 -   [D Program Syntax Reference](reference/d_program_syntax_reference.md)
     -   [Program Structure](reference/d_program_syntax_reference_program_structure.md)
     -   [Types, Operators, and Expressions](reference/dtrace-ref-TypesOperatorsandExpressions.md)
-        -   [Identifier Names and Keywords](reference/dtrace-ref-TypesOperatorsandExpressions.md#dt_ident_dlang)
-        -   [Data Types and Sizes](reference/dtrace-ref-TypesOperatorsandExpressions.md#dt_dtypes_dlang)
-        -   [Constants](reference/dtrace-ref-TypesOperatorsandExpressions.md#dt_consts_dlang)
-        -   [Arithmetic Operators](reference/dtrace-ref-TypesOperatorsandExpressions.md#dt_arithops_dlang)
-        -   [Relational Operators](reference/dtrace-ref-TypesOperatorsandExpressions.md#dt_relatops_dlang)
-        -   [Logical Operators](reference/dtrace-ref-TypesOperatorsandExpressions.md#dt_logicops_dlang)
-        -   [Bitwise Operators](reference/dtrace-ref-TypesOperatorsandExpressions.md#dt_bitwiseops_dlang)
-        -   [Assignment Operators](reference/dtrace-ref-TypesOperatorsandExpressions.md#dt_assignops_dlang)
-        -   [Increment and Decrement Operators](reference/dtrace-ref-TypesOperatorsandExpressions.md#dt_incdecops_dlang)
-        -   [Conditional Expressions](reference/dtrace-ref-TypesOperatorsandExpressions.md#dt_condexp_dlang)
-        -   [Type Conversions](reference/dtrace-ref-TypesOperatorsandExpressions.md#dt_typeconv_dlang)
-        -   [Operator Precedence](reference/dtrace-ref-TypesOperatorsandExpressions.md#dt_preced_dlang)
-        -   [Type and Constant Definitions](reference/dtrace-ref-TypesOperatorsandExpressions.md#dt_typcondef_dlang)
-            -   [typedefs](reference/dtrace-ref-TypesOperatorsandExpressions.md#dt_typedefs_dlang)
-            -   [Enumerations](reference/dtrace-ref-TypesOperatorsandExpressions.md#dt_enums_dlang)
-            -   [Inlines](reference/dtrace-ref-TypesOperatorsandExpressions.md#dt_inlines_dlang)
-            -   [Type Namespaces](reference/dtrace-ref-TypesOperatorsandExpressions.md#dt_typens_dlang)
+        -   [Identifier Names and Keywords](reference/dtrace-ref-TypesOperatorsandExpressions.md#identifier-names-and-keywords)
+        -   [Data Types and Sizes](reference/dtrace-ref-TypesOperatorsandExpressions.md#data-types-and-sizes)
+        -   [Constants](reference/dtrace-ref-TypesOperatorsandExpressions.md#constants)
+        -   [Arithmetic Operators](reference/dtrace-ref-TypesOperatorsandExpressions.md#arithmetic-operators)
+        -   [Relational Operators](reference/dtrace-ref-TypesOperatorsandExpressions.md#relational-operators)
+        -   [Logical Operators](reference/dtrace-ref-TypesOperatorsandExpressions.md#logical-operators)
+        -   [Bitwise Operators](reference/dtrace-ref-TypesOperatorsandExpressions.md#bitwise-operators)
+        -   [Assignment Operators](reference/dtrace-ref-TypesOperatorsandExpressions.md#assignment-operators)
+        -   [Increment and Decrement Operators](reference/dtrace-ref-TypesOperatorsandExpressions.md#increment-and-decrement-operators)
+        -   [Conditional Expressions](reference/dtrace-ref-TypesOperatorsandExpressions.md#conditional-expressions)
+        -   [Type Conversions](reference/dtrace-ref-TypesOperatorsandExpressions.md#type-conversions)
+        -   [Operator Precedence](reference/dtrace-ref-TypesOperatorsandExpressions.md#operator-precedence)
+        -   [Type and Constant Definitions](reference/dtrace-ref-TypesOperatorsandExpressions.md#type-and-constant-definitions)
+            -   [typedefs](reference/dtrace-ref-TypesOperatorsandExpressions.md#typedefs)
+            -   [Enumerations](reference/dtrace-ref-TypesOperatorsandExpressions.md#enumerations)
+            -   [Inlines](reference/dtrace-ref-TypesOperatorsandExpressions.md#inlines)
+            -   [Type Namespaces](reference/dtrace-ref-TypesOperatorsandExpressions.md#type-namespaces)
     -   [Variables](reference/dtrace-ref-Variables.md)
-        -   [Variable Scope](reference/dtrace-ref-Variables.md#dt_vscope_dlang)
+        -   [Variable Scope](reference/dtrace-ref-Variables.md#variable-scope)
     -   [Pointers](reference/dtrace-ref-PointersandScalarArrays.md)
-        -   [Pointer Safety](reference/dtrace-ref-PointersandScalarArrays.md#dt_ptrsafety_dlang)
-        -   [Pointer and Array Relationship](reference/dtrace-ref-PointersandScalarArrays.md#dt_ptrarel_dlang)
-        -   [Pointer Arithmetic](reference/dtrace-ref-PointersandScalarArrays.md#dt_ptrarith_dlang)
-        -   [Generic Pointers](reference/dtrace-ref-PointersandScalarArrays.md#dt_genptr_dlang)
-        -   [Pointers to DTrace Objects](reference/dtrace-ref-PointersandScalarArrays.md#dt_ptrobj_dlang)
-        -   [Pointers and Address Spaces](reference/dtrace-ref-PointersandScalarArrays.md#dt_ptraddrsp_dlang)
+        -   [Pointer Safety](reference/dtrace-ref-PointersandScalarArrays.md#pointer-safety)
+        -   [Pointer and Array Relationship](reference/dtrace-ref-PointersandScalarArrays.md#pointer-and-array-relationship)
+        -   [Pointer Arithmetic](reference/dtrace-ref-PointersandScalarArrays.md#pointer-arithmetic)
+        -   [Generic Pointers](reference/dtrace-ref-PointersandScalarArrays.md#generic-pointers)
+        -   [Pointers to DTrace Objects](reference/dtrace-ref-PointersandScalarArrays.md#pointers-to-dtrace-objects)
+        -   [Pointers and Address Spaces](reference/dtrace-ref-PointersandScalarArrays.md#pointers-and-address-spaces)
     -   [Structs and Unions](reference/dtrace-ref-StructsandUnions.md)
-        -   [Structs](reference/dtrace-ref-StructsandUnions.md#dt_structs_dlang)
-        -   [Pointers to Structs](reference/dtrace-ref-StructsandUnions.md#dt_ptrstructs_dlang)
-        -   [Unions](reference/dtrace-ref-StructsandUnions.md#dt_unions_dlang)
-        -   [Member Sizes and Offsets](reference/dtrace-ref-StructsandUnions.md#dt_memsz_dlang)
-        -   [Bit-Fields](reference/dtrace-ref-StructsandUnions.md#dt_bitflds_dlang)
+        -   [Structs](reference/dtrace-ref-StructsandUnions.md#structs)
+        -   [Pointers to Structs](reference/dtrace-ref-StructsandUnions.md#pointers-to-structs)
+        -   [Unions](reference/dtrace-ref-StructsandUnions.md#unions)
+        -   [Member Sizes and Offsets](reference/dtrace-ref-StructsandUnions.md#member-sizes-and-offsets)
+        -   [Bit-Fields](reference/dtrace-ref-StructsandUnions.md#bit-fields)
     -   [DTrace String Processing](reference/dtrace-ref-DTraceSupportforStrings.md)
-        -   [String Representation](reference/dtrace-ref-DTraceSupportforStrings.md#dt_strrep_dlang)
-        -   [String Constants](reference/dtrace-ref-DTraceSupportforStrings.md#dt_strcon_dlang)
-        -   [String Assignment](reference/dtrace-ref-DTraceSupportforStrings.md#dt_strasg_dlang)
-        -   [String Conversion](reference/dtrace-ref-DTraceSupportforStrings.md#dt_strconv_dlang)
-        -   [String Comparison](reference/dtrace-ref-DTraceSupportforStrings.md#dt_strcomp_dlang)
+        -   [String Representation](reference/dtrace-ref-DTraceSupportforStrings.md#string-representation)
+        -   [String Constants](reference/dtrace-ref-DTraceSupportforStrings.md#string-constants)
+        -   [String Assignment](reference/dtrace-ref-DTraceSupportforStrings.md#string-assignment)
+        -   [String Conversion](reference/dtrace-ref-DTraceSupportforStrings.md#string-conversion)
+        -   [String Comparison](reference/dtrace-ref-DTraceSupportforStrings.md#string-comparison)
     -   [Aggregations](reference/aggregation.md)
-        -   [Aggregation Functions](reference/aggregation.md#dt_ref_aggr_funcs)
-	-   [Printing Aggregations](reference/aggregation.md#dt_ref_aggr_print)
-	-   [Data Normalization](reference/aggregation.md#dt_ref_aggr_dnorm)
+        -   [Aggregation Functions](reference/aggregation.md#aggregation-functions)
+	-   [Printing Aggregations](reference/aggregation.md#printing-aggregations)
+	-   [Data Normalization](reference/aggregation.md#data-normalization)
     -   [Speculation](reference/dtrace-ref-speculation.md)
 -   [DTrace Runtime and Compile-time Options Reference](reference/dtrace_runtime_options.md)
     -   [Setting DTrace Compile-time and Runtime Options](reference/setting_dtrace_compiler_and_runtime_options.md)
diff --git a/doc/userguide/reference/aggregation.md b/doc/userguide/reference/aggregation.md
index 0114d26f3..d1411aab5 100644
--- a/doc/userguide/reference/aggregation.md
+++ b/doc/userguide/reference/aggregation.md
@@ -13,7 +13,7 @@ Aggregations can be regular or indexed. Indexed aggregations use keys, where *ke
 
 The *aggfunc* is one of the DTrace aggregating functions, and *args* is a comma-separated list of arguments appropriate to that function. Most aggregating functions take a single argument that represents the new datum.
 
-## Aggregation Functions {#dt_ref_aggr_funcs}
+## Aggregation Functions
 
 The following functions are aggregating functions that can be used in a program to collect data and present it in a meaningful way.
 
@@ -36,7 +36,7 @@ The following functions are aggregating functions that can be used in a program
 -   `[llquantize](aggregation_llquantize.md)`: Stores the log-linear frequency distribution in an aggregation.
 
 
-## Printing Aggregations {#dt_ref_aggr_print}
+## Printing Aggregations
 
 By default, several aggregations are displayed in the order in which they're introduced in the D program. You can override this behavior by using the `[printa](function_printa.md)` function to print the aggregations. The `printa` function also lets you precisely format the aggregation data by using a format string.
 
@@ -44,7 +44,7 @@ If an aggregation isn't formatted with a `printa` statement in a D program, the
 
 The default output format for the `avg`, `count`, `min`, `max`, `stddev`, and `sum` aggregating functions displays an integer decimal value corresponding to the aggregated value for each tuple. The default output format for the `quantize`, `lquantize`, and `llquantize` aggregating functions displays an ASCII histogram with the results. Aggregation tuples are printed as though `trace` had been applied to each tuple element.
 
-## Data Normalization {#dt_ref_aggr_dnorm}
+## Data Normalization
 
 When aggregating data over some period, you might want to normalize the data based on some constant factor. This technique lets you compare disjointed data more easily. For example, when aggregating system calls, you might want to output system calls as a per-second rate instead of as an absolute value over the course of the run. The DTrace `[normalize](function_normalize.md)` function lets you normalize data in this way. The parameters to `normalize` are an aggregation and a normalization factor. The output of the aggregation shows each value divided by the normalization factor.
 
diff --git a/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md b/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
index 367d9b133..38ddc4c08 100644
--- a/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
+++ b/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
@@ -5,7 +5,7 @@ DTrace provides facilities for tracing and manipulating strings. This section de
 
 **Parent topic:**[D Program Syntax Reference](../reference/d_program_syntax_reference.md)
 
-## String Representation {#dt_strrep_dlang}
+## String Representation
 
 In DTrace, strings are represented as an array of characters ending in a null byte, which is a byte with a value of zero, usually written as `'\0'`. The visible part of the string is of variable length, depending on the location of the null byte, but DTrace stores each string in a fixed-size array so that each probe traces a consistent amount of data. Strings cannot exceed the length of the predefined string limit. However, the limit can be modified in your D program or on the `dtrace` command line by tuning the `strsize` option. The default string limit is 256 bytes.
 
@@ -33,13 +33,13 @@ trace(s);
 
 You can also perform lexical comparison of expressions of type string. See [String Comparison](dtrace-ref-DTraceSupportforStrings.md).
 
-## String Constants {#dt_strcon_dlang}
+## String Constants
 
 String constants are enclosed in pairs of double quotes \(`""`\) and are automatically assigned the type `string` by the D compiler. You can define string constants of any length, limited only by the amount of memory DTrace is permitted to consume on the system and by whatever limit you have set for the `strsize` DTrace runtime option. The terminating null byte \(`\0`\) is added automatically by the D compiler to any string constants that you declare. The size of a string constant object is the number of bytes associated with the string, plus one additional byte for the terminating null byte.
 
 A string constant can't contain a literal newline character. To create strings containing newlines, use the `\n` escape sequence instead of a literal newline. String constants can also contain any of the special character escape sequences that are defined for character constants.
 
-## String Assignment {#dt_strasg_dlang}
+## String Assignment
 
 Unlike the assignment of `char *` variables, strings are copied by value and not by reference. The string assignment operator `=` copies the actual bytes of the string from the source operand up to and including the null byte to the variable on the left-hand side, which must be of type `string`.
 
@@ -63,7 +63,7 @@ String assignment is analogous to the C library function `strcpy()`, with the ex
 
 You can also assign to a string variable an expression of a type that's compatible with strings. In this case, the D compiler automatically promotes the source expression to the string type and performs a string assignment. The D compiler permits any expression of type `char *` or of type `char[n]`, a scalar array of `char` of any size, to be promoted to a string.
 
-## String Conversion {#dt_strconv_dlang}
+## String Conversion
 
 Expressions of other types can be explicitly converted to type `string` by using a cast expression or by applying the special `stringof` operator, which are equivalent in the following meaning:
 
@@ -78,7 +78,7 @@ The `stringof` operator binds very tightly to the operand on its right-hand side
 
 Scalar type expressions, such as a pointer or integer, or a scalar array address can be converted to strings, in that the scalar is interpreted as an address to a char type. Expressions of other types such as `void` may not be converted to `string`. If you erroneously convert an invalid address to a string, the DTrace safety features prevents you from damaging the system or DTrace, but you might end up tracing a sequence of undecipherable characters.
 
-## String Comparison {#dt_strcomp_dlang}
+## String Comparison
 
 D overloads the binary relational operators and permits them to be used for string comparisons, as well as integer comparisons. The relational operators perform string comparison whenever both operands are of type `string` or when one operand is of type `string` and the other operand can be promoted to type `string`. See [String Assignment](dtrace-ref-DTraceSupportforStrings.md) for a detailed description. See also [Table 1](dtrace-ref-DTraceSupportforStrings.md#dt_t14_dlang), which lists the relational operators that can be used to compare strings.
 
diff --git a/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md b/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md
index 035f5ed15..651751dbe 100644
--- a/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md
+++ b/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md
@@ -29,7 +29,7 @@ In this example, the first fragment creates a D global variable pointer `q`. Bec
 
 **Parent topic:**[D Program Syntax Reference](../reference/d_program_syntax_reference.md)
 
-## Pointer Safety {#dt_ptrsafety_dlang}
+## Pointer Safety
 
 DTrace is a robust, safe environment for running D programs. You might write a buggy D program, but invalid D pointer accesses don't cause DTrace or the OS kernel to fail or crash in any way. Instead, the DTrace software detects any invalid pointer accesses, and returns a `BADADDR` fault; the current clause execution quits, an ERROR probe fires, and tracing continues unless the program called `[exit](function_exit.md)` for the ERROR probe.
 
@@ -55,7 +55,7 @@ dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): invalid address (0x0
 
 Notice that the D program moves past the error and continues to run; the system and all observed processes remain unperturbed. You can also add an `ERROR` probe to any script to handle D errors. For details about the DTrace error mechanism, see [ERROR Probe](dtrace_providers_dtrace.md).
 
-## Pointer and Array Relationship {#dt_ptrarel_dlang}
+## Pointer and Array Relationship
 
 A scalar array is represented by a variable that's associated with the address of its first storage location. A pointer is also the address of a storage location with a defined type. Thus, D permits the use of the array `[]` index notation with both pointer variables and array variables. For example, the following two D fragments are equivalent in meaning:
 
@@ -71,7 +71,7 @@ The difference between pointers and arrays is that a pointer variable refers to
 
 This difference is manifested in the D syntax if you try to assign pointers and scalar arrays. If `x` and `y` are pointer variables, the expression `x = y` is legal; it copies the pointer address in `y` to the storage location that's named by `x`. If `x` and `y` are scalar array variables, the expression `x = y` isn't legal. Arrays can't be assigned as a whole in D. If `p` is a pointer and `a` is a scalar array, the statement `p = a` is permitted. This statement is equivalent to the statement `p = &a[0]`.
 
-## Pointer Arithmetic {#dt_ptrarith_dlang}
+## Pointer Arithmetic
 
 As in C, pointer arithmetic in D isn't identical to integer arithmetic. Pointer arithmetic implicitly adjusts the underlying address by multiplying or dividing the operands by the size of the type referenced by the pointer.
 
@@ -106,17 +106,17 @@ BEGIN
 }
 ```
 
-## Generic Pointers {#dt_genptr_dlang}
+## Generic Pointers
 
 Sometimes it's useful to represent or manipulate a generic pointer address in a D program without specifying the type of data referred to by the pointer. Generic pointers can be specified by using the type `void *`, where the keyword `void` represents the absence of specific type information, or by using the built-in type alias `uintptr_t`, which is aliased to an unsigned integer type of size that's appropriate for a pointer in the current data model. You can't apply pointer arithmetic to an object of type `void *`, and these pointers can't be dereferenced without casting them to another type first. You can cast a pointer to the `uintptr_t` type when you need to perform integer arithmetic on the pointer value.
 
 Pointers to `void` can be used in any context where a pointer to another data type is required, such as an associative array tuple expression or the right-hand side of an assignment statement. Similarly, a pointer to any data type can be used in a context where a pointer to `void` is required. To use a pointer to a non-`void` type in place of another non-`void` pointer type, an explicit cast is required. You must always use explicit casts to convert pointers to integer types, such as `uintptr_t`, or to convert these integers back to the appropriate pointer type.
 
-## Pointers to DTrace Objects {#dt_ptrobj_dlang}
+## Pointers to DTrace Objects
 
 The D compiler prohibits you from using the `&` operator to obtain pointers to DTrace objects such as associative arrays, built-in functions, and variables. You're prohibited from obtaining the address of these variables so that the DTrace runtime environment is free to relocate them as needed between probe firings . In this way, DTrace can more efficiently manage the memory required for programs. If you create composite structures, it's possible to construct expressions that retrieve the kernel address of DTrace object storage. Avoid creating such expressions in D programs. If you need to use such an expression, don't rely on the address being the same across probe firings.
 
-## Pointers and Address Spaces {#dt_ptraddrsp_dlang}
+## Pointers and Address Spaces
 
 A pointer is an address that provides a translation within some *virtual address space* to a piece of physical memory. DTrace runs D programs within the address space of the OS kernel itself. The Linux system manages many address spaces: one for the OS kernel itself, and one for each user process. Because each address space provides the illusion that it can access all the memory on the system, the same virtual address pointer value can be reused across address spaces, but translate to different physical memory. Therefore, when writing D programs that use pointers, you must be aware of the address space corresponding to the pointers you intend to use.
 
diff --git a/doc/userguide/reference/dtrace-ref-StructsandUnions.md b/doc/userguide/reference/dtrace-ref-StructsandUnions.md
index 79115e362..fcd07320f 100644
--- a/doc/userguide/reference/dtrace-ref-StructsandUnions.md
+++ b/doc/userguide/reference/dtrace-ref-StructsandUnions.md
@@ -5,7 +5,7 @@ Collections of related variables can be grouped together into composite data obj
 
 **Parent topic:**[D Program Syntax Reference](../reference/d_program_syntax_reference.md)
 
-## Structs {#dt_structs_dlang}
+## Structs
 
 The D keyword `struct`, short for *structure*, is used to introduce a new type that's composed of a group of other types. The new `struct` type can be used as the type for D variables and arrays, enabling you to define groups of related variables under a single name. D structs are the same as the corresponding construct in C and C++. If you have programmed in the Java programming language, think of a D struct as a class that contains only data members and no methods.
 
@@ -122,7 +122,7 @@ The `date` program runs and is traced until it exits and fires the `END` probe w
  write    1         29          9817
 ```
 
-## Pointers to Structs {#dt_ptrstructs_dlang}
+## Pointers to Structs
 
 Referring to structs by using pointers is common in C and D. You can use the operator `->` to access struct members through a pointer. If `struct s` has a member `m`, and you have a pointer to this struct named `sp`, where `sp` is a variable of type `struct s *`, you can either use the `*` operator to first dereference the `sp` pointer to access the member:
 
@@ -217,11 +217,11 @@ date -R  run by UID 500
 
 Complex data structures are used often in C programs, so the ability to describe and reference structs from D also provides a powerful capability for observing the inner workings of the Linux kernel and its system interfaces.
 
-## Unions {#dt_unions_dlang}
+## Unions
 
 Unions are another kind of composite type available in ANSI C and D and are related to structs. A union is a composite type where a set of members of different types are defined and the member objects all occupy the same region of storage. A union is therefore an object of variant type, where only one member is valid at any particular time, depending on how the union has been assigned. Typically, some other variable, or piece of state is used to indicate which union member is currently valid. The size of a union is the size of its largest member. The memory alignment that's used for the union is the maximum alignment required by the union members.
 
-## Member Sizes and Offsets {#dt_memsz_dlang}
+## Member Sizes and Offsets
 
 You can determine the size in bytes of any D type or expression, including a `struct` or `union`, by using the `sizeof` operator. The `sizeof` operator can be applied either to an expression or to the name of a type surrounded by parentheses, as illustrated in the following two examples:
 
@@ -240,7 +240,7 @@ offsetof (*type-name*, *member-name*)
 
 Here, *type-name* is the name of any `struct` or `union` type or type alias, and *member-name* is the identifier naming a member of that struct or union. Similar to `sizeof`, `offsetof` returns a `size_t` and you can use it anywhere in a D program that an integer constant can be used.
 
-## Bit-Fields {#dt_bitflds_dlang}
+## Bit-Fields
 
 D also permits the definition of integer struct and union members of arbitrary numbers of bits, known as *bit-fields*. A bit-field is declared by specifying a signed or unsigned integer base type, a member name, and a suffix indicating the number of bits to be assigned for the field, as shown in the following example:
 
diff --git a/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md b/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
index 013989706..2d7172366 100644
--- a/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
+++ b/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
@@ -5,7 +5,7 @@ D provides the ability to access and manipulate various data objects: variables
 
 **Parent topic:**[D Program Syntax Reference](../reference/d_program_syntax_reference.md)
 
-## Identifier Names and Keywords {#dt_ident_dlang}
+## Identifier Names and Keywords
 
 D identifier names are composed of uppercase and lowercase letters, digits, and underscores, where the first character must be a letter or underscore. All identifier names beginning with an underscore \(`_`\) are reserved for use by the D system libraries. Avoid using these names in D programs. By convention, D programmers typically use mixed-case names for variables and all uppercase names for constants.
 
@@ -203,7 +203,7 @@ D language keywords are special identifiers that are reserved for use in the pro
 </td></tr><tbody></table>
 D reserves for use as keywords a superset of the ANSI C keywords. The keywords reserved for future use by the D language are marked with `*`. The D compiler produces a syntax error if you try to use a keyword that's reserved for future use. The keywords that are defined by D but not defined by ANSI C are marked with `+`. D provides the complete set of types and operators found in ANSI C. The major difference in D programming is the absence of control-flow constructs. Note that keywords associated with control-flow in ANSI C are reserved for future use in D.
 
-## Data Types and Sizes {#dt_dtypes_dlang}
+## Data Types and Sizes
 
 D provides fundamental data types for integers and floating-point constants. Arithmetic can only be performed on integers in D programs. Floating-point constants can be used to initialize data structures, but floating-point arithmetic isn't permitted in D. D provides a 64-bit data model for use in writing programs.
 
@@ -392,7 +392,7 @@ Type Name
 </td></tr><tbody></table>
 D also provides the special type `string` to represent ASCII strings. Strings are discussed in more detail in [DTrace String Processing](dtrace-ref-DTraceSupportforStrings.md).
 
-## Constants {#dt_consts_dlang}
+## Constants
 
 Integer constants can be written in decimal \(`12345`\), octal \(`012345`\), or hexadecimal `(0x12345`\) format. Octal \(base 8\) constants must be prefixed with a leading zero. Hexadecimal \(base 16\) constants must be prefixed with either `0x` or `0X`. Integer constants are assigned the smallest type among `int`, `long`, and `long long` that can represent their value. If the value is negative, the signed version of the type is used. If the value is positive and too large to fit in the signed type representation, the unsigned type representation is used. You can apply one of the suffixes listed in the following table to any integer constant to explicitly specify its D type.
 
@@ -607,7 +607,7 @@ You can include more than one character specifier inside single quotes to create
 
 Strings constants of any length can be composed by enclosing them in a pair of double quotes \(`"hello"`\). A string constant can't contain a literal newline character. To create strings containing newlines, use the `\n` escape sequence instead of a literal newline. String constants can contain any of the special character escape sequences that are shown for character constants before. Similar to ANSI C, strings are represented as arrays of characters that end with a null character \(`\0`\) that's implicitly added to each string constant you declare. String constants are assigned the special D type `string`. The D compiler provides a set of special features for comparing and tracing character arrays that are declared as strings.
 
-## Arithmetic Operators {#dt_arithops_dlang}
+## Arithmetic Operators
 
 Binary arithmetic operators are described in the following table. These operators all have the same meaning for integers that they do in ANSI C.
 
@@ -666,7 +666,7 @@ However, the DTrace execution environment does automatically check for and repor
 
 In addition to these binary operators, the `+` and `-` operators can also be used as unary operators, and these operators have higher precedence than any of the binary arithmetic operators. The order of precedence and associativity properties for all D operators is presented in [Operator Precedence](dtrace-ref-TypesOperatorsandExpressions.md). You can control precedence by grouping expressions in parentheses \(`()`\).
 
-## Relational Operators {#dt_relatops_dlang}
+## Relational Operators
 
 Binary relational operators are described in the following table. These operators all have the same meaning that they do in ANSI C.
 
@@ -766,7 +766,7 @@ Returns 0 \(`false`\)
 </td></tr><tbody></table>
 Relational operators can also be used to compare a data object associated with an enumeration type with any of the enumerator tags defined by the enumeration.
 
-## Logical Operators {#dt_logicops_dlang}
+## Logical Operators
 
 Binary logical operators are listed in the following table. The first two operators are equivalent to the corresponding ANSI C operators.
 
@@ -809,7 +809,7 @@ In addition to the binary logical operators, the unary `!` operator can be used
 
 The logical operators can be applied to operands of integer or pointer types. The logical operators interpret pointer operands as unsigned integer values. As with all logical and relational operators in D, operands are true if they have a non-zero integer value and false if they have a zero integer value.
 
-## Bitwise Operators {#dt_bitwiseops_dlang}
+## Bitwise Operators
 
 D provides the bitwise operators that are listed in the following table for manipulating individual bits inside integer operands. These operators all have the same meaning as in ANSI C.
 
@@ -874,7 +874,7 @@ The shift operators are used to move bits left or right in a particular integer
 
 Shifting an integer value by a negative number of bits or by a number of bits larger than the number of bits in the left-hand operand itself produces an undefined result. The D compiler produces an error message if the compiler can detect this condition when you compile the D program.
 
-## Assignment Operators {#dt_assignops_dlang}
+## Assignment Operators
 
 Binary assignment operators are listed in the following table. You can only modify D variables and arrays. Kernel data objects and constants can not be modified using the D assignment operators. The assignment operators have the same meaning as they do in ANSI C.
 
@@ -979,7 +979,7 @@ Aside from the assignment operator `=`, the other assignment operators are provi
 
 The result of any assignment operator is an expression equal to the new value of the left-hand expression. You can use the assignment operators or any of the operators described thus far in combination to form expressions of arbitrary complexity. You can use parentheses `()` to group terms in complex expressions.
 
-## Increment and Decrement Operators {#dt_incdecops_dlang}
+## Increment and Decrement Operators
 
 D provides the special unary `++` and `--` operators for incrementing and decrementing pointers and integers. These operators have the same meaning as they do in ANSI C. These operators can be applied to variables and to the individual elements of a struct, union, or array. The operators can be applied either before or after the variable name. If the operator appears before the variable name, the variable is first changed and then the resulting expression is equal to the new value of the variable. For example, the following two code fragments produce identical results:
 
@@ -1012,7 +1012,7 @@ foo[1]++;
 
 The increment and decrement operators can be applied to integer or pointer variables. When applied to integer variables, the operators increment, or decrement the corresponding value by one. When applied to pointer variables, the operators increment, or decrement the pointer address by the size of the data type that's referenced by the pointer.
 
-## Conditional Expressions {#dt_condexp_dlang}
+## Conditional Expressions
 
 D doesn't provide the facility to use `if-then-else` constructs. Instead, conditional expressions, by using the ternary operator \(`?:`\), can be used to approximate some of this functionality. The ternary operator associates a triplet of expressions, where the first expression is used to conditionally evaluate one of the other two.
 
@@ -1032,7 +1032,7 @@ hexval = (c >= '0' && c <= '9') ? c - '0' : (c >= 'a' && c <= 'f') ? c + 10 - 'a
 
 To be evaluated for its truth value, the first expression that's used with `?:` must be a pointer or integer. The second and third expressions can be of any compatible types. You can't construct a conditional expression where, for example, one path returns a string and another path returns an integer. The second and third expressions must be true expressions that have a value. Therefore, data reporting functions can't be used in these expressions because those functions don't return a value. To conditionally trace data, use a predicate instead.
 
-## Type Conversions {#dt_typeconv_dlang}
+## Type Conversions
 
 When expressions are constructed by using operands of different but compatible types, type conversions are performed to determine the type of the resulting expression. The D rules for type conversions are the same as the arithmetic conversion rules for integers in ANSI C. These rules are sometimes referred to as the *usual arithmetic conversions*.
 
@@ -1052,7 +1052,7 @@ In this example, the destination type is within parentheses and used to prefix t
 
 Because D doesn't include floating-point arithmetic, no floating-point operand conversion or casting is permitted and no rules for implicit floating-point conversion are defined.
 
-## Operator Precedence {#dt_preced_dlang}
+## Operator Precedence
 
 D includes complex rules for operator precedence and associativity. The rules provide precise compatibility with the ANSI C operator precedence rules. The entries in the following table are in order from highest precedence to lowest precedence.
 
@@ -1268,11 +1268,11 @@ Dereferences a pointer to an object.
 Accesses a member of a structure or union type.
 
 </td></tr><tbody></table>
-## Type and Constant Definitions {#dt_typcondef_dlang}
+## Type and Constant Definitions
 
 This section describes how to declare type aliases and named constants in D. It also discusses D type and namespace management for program and OS types and identifiers.
 
-### typedefs {#dt_typedefs_dlang}
+### typedefs
 
 The `typedef` keyword is used to declare an identifier as an alias for an existing type. The `typedef` declaration is used outside of probe clauses in the following form:
 
@@ -1297,7 +1297,7 @@ typedef struct foo {
 
 In the previous example, `struct foo` is defined using the same type as its alias, `foo_t`. Linux C system headers often use the suffix `_t` to denote a `typedef` alias.
 
-### Enumerations {#dt_enums_dlang}
+### Enumerations
 
 Defining symbolic names for constants in a program eases readability and simplifies the process of maintaining the program in the future. One method is to define an *enumeration*, which associates a set of integers with a set of identifiers called enumerators that the compiler recognizes and replaces with the corresponding integer value. An enumeration is defined by using a declaration such as the following:
 
@@ -1329,7 +1329,7 @@ The D enumeration syntax is the same as the corresponding syntax in ANSI C. D al
 
 
 
-### Inlines {#dt_inlines_dlang}
+### Inlines
 
 D named constants can also be defined by using `inline` directives, which provide a more general means of creating identifiers that are replaced by predefined values or expressions during compilation. Inline directives are a more powerful form of lexical replacement than the `#define` directive provided by the C preprocessor because the replacement is assigned an actual type and is performed by using the compiled syntax tree and not a set of lexical tokens. An `inline` directive is specified by using a declaration of the following form:
 
@@ -1371,7 +1371,7 @@ These inline definitions provide you with access to the current set of Linux sig
 
 By default, the D compiler includes all the provided D library files automatically so that you can use these definitions in any D program.
 
-### Type Namespaces {#dt_typens_dlang}
+### Type Namespaces
 
 In traditional languages such as ANSI C, type visibility is determined by whether a type is nested inside a function or other declaration. Types declared at the outer scope of a C program are associated with a single global namespace and are visible throughout the entire program. Types that are defined in C header files are typically included in this outer scope. Unlike these languages, D provides access to types from several outer scopes.
 
diff --git a/doc/userguide/reference/dtrace-ref-Variables.md b/doc/userguide/reference/dtrace-ref-Variables.md
index c4d7c4014..28ffa693d 100644
--- a/doc/userguide/reference/dtrace-ref-Variables.md
+++ b/doc/userguide/reference/dtrace-ref-Variables.md
@@ -80,7 +80,7 @@ D provides several variable types: scalar variables, associative arrays, scalar
 
 **Parent topic:**[D Program Syntax Reference](../reference/d_program_syntax_reference.md)
 
-## Variable Scope {#dt_vscope_dlang}
+## Variable Scope
 
 Variable scoping is used to define where variable names are valid within a program and to avoid variable naming collisions. By using scoped variables you can control the availability of the variable instance to the whole program, a particular thread, or a specific clause.
 
-- 
2.47.3

